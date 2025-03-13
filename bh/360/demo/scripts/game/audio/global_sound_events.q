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
	randomness = none
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
star_power_awarded_sfx_p1_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			sp_awarded1
			vol = -8
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
	randomness = none
	sounds = [
		{
			sp_awarded1
			vol = -8
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
	randomness = none
	sounds = [
		{
			sp_awarded1
			vol = -8
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
			vol = 2
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
			vol = -12.42
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
			vol = -14
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
			vol = -14
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
star_power_deployed_cheer_sfx_container = {
	default_priority = 90
	default_buss = ui_star_power
	norepeatfor = 0.02
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
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
	default_buss = ui_star_power
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
	default_buss = ui_star_power
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
	default_buss = ui_star_power
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
ui_sfx_scroll_container = {
	default_priority = 90
	default_buss = front_end
	norepeatfor = 0.03
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			scroll
			vol = 2
		}
	]
}
pause_menu_sfx_container = {
	default_priority = 90
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			setlist_to_playlist_select
			vol = -3
		}
	]
}
ui_sfx_select_container = {
	default_priority = 90
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sound_05
			vol = -7.5
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
donothing_oneshot_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
lg_ext_crowd_swell_short_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_crowd_swell_sh
			vol = 4
		}
	]
}
lg_ext_crowd_swell_short_soft_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_crowd_swell_sh
			vol = -5
		}
	]
}
lg_ext_crowd_swell_med_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_crowd_swell_md
			vol = 2
		}
	]
}
lg_ext_crowd_swell_long_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_crowd_swell_lg
			vol = 3
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
			sm_crowd_boo_01
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			randomvol = {
				type = randomrangetype
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
			vol = -7
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
lg_ext_crowd_transition_positive_to_neutral_l_container = {
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_transitions
	norepeatfor = 0.2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_crowd_swell_lg
			vol = 3
		}
	]
}
md_int_crowd_swell_long_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_crowd_swell_lg
			vol = 5
		}
	]
}
sm_int_crowd_swell_long_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_crowd_swell_lg
			vol = 2
		}
	]
}
md_ext_crowd_swell_med_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_crowd_swell_md
			vol = 3
		}
	]
}
md_int_crowd_swell_med_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_crowd_swell_md
			vol = 2
		}
	]
}
sm_int_crowd_swell_med_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_crowd_swell_md
			vol = 2
		}
	]
}
md_ext_crowd_swell_short_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_crowd_swell_sh
			vol = 3
		}
	]
}
md_ext_crowd_swell_short_soft_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_crowd_swell_sh
			vol = -3
		}
	]
}
md_int_crowd_swell_short_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_crowd_swell_sh
			vol = 2.5
		}
	]
}
md_int_crowd_swell_short_soft_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_crowd_swell_sh
			vol = -3
		}
	]
}
sm_int_crowd_swell_short_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_crowd_swell_sh
			vol = 4
		}
	]
}
sm_int_crowd_swell_short_soft_container = {
	default_priority = 90
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_crowd_swell_sh
			vol = -4
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
			pitch = 2
			vol = 0
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
			checkbox_uncheck_sfx
			pitch = 0
			vol = -3
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
			vol = -3
		}
	]
}
ui_sfx_scroll_add_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_scroll_add2
			vol = -4.14
		}
	]
}
ui_sfx_lose_multiplier_2x_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -7
			pitch = -3
		}
	]
}
0x9be6e4e7 = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -10
			pitch = -3
		}
	]
}
ui_sfx_lose_multiplier_3x_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -7
			pitch = -3
		}
	]
}
0x1c402fa4 = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -10
			pitch = -3
		}
	]
}
ui_sfx_lose_multiplier_4x_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -7
			pitch = -3
		}
	]
}
0x3cd253ef = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x510b41c1
			vol = -10
			pitch = -3
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
cheat_single_strum_note_1_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_single_strum_note_2_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_single_strum_note_3_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_single_strum_note_4_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_single_strum_note_5_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_1_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_2_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_3_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_4_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_5_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_6_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_7_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_8_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_9_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_10_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_11_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
cheat_chord_strum_12_container = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
			checkbox_check_sfx
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
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_100_note_streak
			vol = -15
		}
	]
}
ui_sfx_50_note_streak_singleplayer_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -15
		}
	]
}
ui_sfx_100_note_streak_p1_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_100_note_streak
			vol = -15
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
ui_sfx_50_note_streak_p1_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -15
			pan1x = -1.0
			pan1y = 0.27
			pan2x = -0.85
			pan2y = 1.0
		}
	]
}
ui_sfx_100_note_streak_p2_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -15
			pan1x = 0.9
			pan1y = 1.0
			pan2x = 1.0
			pan2y = 0.63
		}
	]
}
ui_sfx_50_note_streak_p2_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ui_sfx_50_note_streak
			vol = -15
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
lg_ext_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_crowd_applause
			vol = -3
		}
	]
}
lg_int_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			lg_int_crowd_applause
			vol = -3
		}
	]
}
md_ext_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_crowd_applause
			vol = -5
		}
	]
}
md_int_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			int_md_crowd_applause
			vol = -8
		}
	]
}
sm_int_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_crowd_applause
			vol = -11
		}
	]
}
sm_ext_crowd_applause_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			sm_ext_crowd_applause
			vol = -11
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
			vol = -6
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
			lfe_vol = -5
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
			vol = -10.5
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
			vol = -11
		}
	]
}
star_power_deployed_back_gh4_container = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
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
			vol = -10.5
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
			vol = -100
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
			vol = -10.5
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
			vol = -10.5
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
			vol = -16
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
			vol = -16
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
			vol = -100
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
			vol = -100
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
			lfe_vol = -5
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
			vol = -16
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
lg_ext_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_int_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
		{
			lg_int_crowd_whistle_05
			vol = -2
		}
		{
			lg_int_crowd_whistle_06
			vol = -2
		}
		{
			lg_int_crowd_whistle_07
			vol = -2
		}
		{
			lg_int_crowd_whistle_08
			vol = -2
		}
		{
			lg_int_crowd_whistle_09
			vol = -2
		}
		{
			lg_int_crowd_whistle_10
			vol = -2
		}
		{
			lg_int_crowd_whistle_11
			vol = -2
		}
		{
			lg_int_crowd_whistle_12
			vol = -2
		}
		{
			lg_int_crowd_whistle_13
			vol = -2
		}
		{
			lg_int_crowd_whistle_14
			vol = -2
		}
		{
			lg_int_crowd_whistle_15
			vol = -2
		}
		{
			lg_int_crowd_whistle_16
			vol = -2
		}
		{
			lg_int_crowd_whistle_17
			vol = -2
		}
		{
			lg_int_crowd_whistle_18
			vol = -2
		}
		{
			lg_int_crowd_whistle_19
			vol = -2
		}
		{
			lg_int_crowd_whistle_20
			vol = -2
		}
	]
}
md_ext_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
md_ext_crowd_whistle_positive_01_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
md_int_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
sm_ext_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
}
sm_int_crowd_whistle_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_ext_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_int_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
		{
			lg_int_crowd_whistle_05
			vol = -3
		}
		{
			lg_int_crowd_whistle_06
			vol = -3
		}
		{
			lg_int_crowd_whistle_07
			vol = -3
		}
		{
			lg_int_crowd_whistle_08
			vol = -3
		}
		{
			lg_int_crowd_whistle_09
			vol = -3
		}
		{
			lg_int_crowd_whistle_10
			vol = -3
		}
		{
			lg_int_crowd_whistle_11
			vol = -3
		}
		{
			lg_int_crowd_whistle_12
			vol = -3
		}
		{
			lg_int_crowd_whistle_13
			vol = -3
		}
		{
			lg_int_crowd_whistle_14
			vol = -3
		}
		{
			lg_int_crowd_whistle_15
			vol = -3
		}
		{
			lg_int_crowd_whistle_16
			vol = -3
		}
		{
			lg_int_crowd_whistle_17
			vol = -3
		}
		{
			lg_int_crowd_whistle_18
			vol = -3
		}
		{
			lg_int_crowd_whistle_19
			vol = -3
		}
		{
			lg_int_crowd_whistle_20
			vol = -3
		}
	]
}
md_ext_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
md_ext_crowd_oneshot_positive_01_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
md_int_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
			md_int_crowd_cheer_gr_07
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
sm_ext_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
sm_int_crowd_oneshot_positive_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_ext_crowd_oneshot_negative_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_int_crowd_oneshot_negative_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
md_int_crowd_oneshot_negative_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
sm_ext_crowd_oneshot_negative_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
sm_int_crowd_oneshot_negative_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
lg_ext_crowd_positive_swell_layer_container = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 3
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
jamvoxtest_c5_container = {
	default_priority = 50
	default_buss = jammode_vox
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			c5loop
			num_loops = -1
		}
	]
}
jamvoxtest_c3_container = {
	default_priority = 50
	default_buss = jammode_vox
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			c3loop
			num_loops = -1
			vol = 12
		}
	]
}
jamvoxtest_c4_container = {
	default_priority = 50
	default_buss = jammode_vox
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			c4loop
			num_loops = -1
		}
	]
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
	randomness = none
	sounds = [
		{
			guitar_select_affirmation_1
			vol = -8.5
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
			song_affirmation_02
			vol = -8
		}
		{
			song_affirmation_03
			vol = -8
		}
		{
			song_affirmation_05
			vol = -8
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
	randomness = none
	sounds = [
		{
			drum_select_affirmation_01
			vol = -7
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
			vol = 3
		}
	]
}
vocal_selection_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_microphone_2
		}
	]
}
drum_selection_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_drums_1
		}
	]
}
guitar_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_guitar_3
			vol = -7
		}
	]
}
bass_selection_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			bass_select_affirmation_03
			vol = -2
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
	randomness = none
	sounds = [
		{
			bass_select_affirmation_02
			vol = -6
		}
	]
}
sm_int_crowd_clap_to_beat_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
		{
			sm_int_crowd_clap_05
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
		{
			sm_int_crowd_clap_06
			vol = -1
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
	]
}
sm_int_crowd_clap_to_beat_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
sm_int_crowd_clap_to_beat_right_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
sm_int_crowd_clap_to_beat_left_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
sm_int_crowd_clap_to_beat_right_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
sm_int_crowd_clap_to_beat_left_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_left_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_right_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_left_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_int_crowd_clap_to_beat_right_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_right_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_left_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_right_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
lg_ext_crowd_clap_to_beat_left_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_normal_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_left_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_right_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_left_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
md_ext_crowd_clap_to_beat_right_middle_container = {
	default_priority = 90
	default_buss = crowd_star_power
	norepeatfor = 0.001
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
			pitch = 0
			vol = -4
		}
	]
}
audio_options_fader_end_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_select_negative
			pitch = 0
			vol = 7
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
you_rock_explosion_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			you_rock_explode
		}
	]
}
starttesttones_sine_container = {
	default_priority = 75
	default_buss = test_tones
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
}
starttesttones_pink_container = {
	default_priority = 75
	default_buss = test_tones
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
			audio_options_fader_scroll
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
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_options_sound_dolbydigitaldisable
			vol = -1
		}
	]
}
dolby_on_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_dolbydigitalenable_surround_l
			vol = -2
			pan1x = -1.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_c
			vol = -2
			pan1x = 0.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_r
			vol = -2
			pan1x = 1.0
			pan1y = 1.0
		}
		{
			menu_dolbydigitalenable_surround_ls
			vol = -2
			pan1x = -1.0
			pan1y = -1.0
		}
		{
			menu_dolbydigitalenable_surround_rs
			vol = -2
			pan1x = 1.0
			pan1y = -1.0
		}
		{
			menu_dolbydigitalenable_surround_lf
			vol = -2
			lfeonly = true
			lfe_vol = -15
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
			audio_options_select
			vol = 4
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
			audio_options_back
			vol = 1
		}
	]
}
gigboard_zoom_left_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -12.5
		}
	]
}
gigboard_zoom_right_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gigboard_camerapan_left
			vol = -12.5
		}
	]
}
colorwheel_rotate_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_rotate
			vol = 2
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
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_1
			vol = -7
		}
	]
}
colorwheel_selectcolor_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
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
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_selectpie
			vol = -4
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
	randomness = none
	sounds = [
		{
			menu_entername_scroll_3
			pitch = -2
			vol = -11
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
			menu_entername_scroll_3
			pitch = -2
			vol = -11
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
			menu_entername_select
			pitch = 0
			vol = -5
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
	default_buss = front_end
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
	default_buss = front_end
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
	default_buss = front_end
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
	default_buss = front_end
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
	default_buss = options_sfx
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = mic_options_sfx_buss
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_mic
			vol = -10
			pitch = -0.95
		}
	]
}
audio_options_menu_crowd_container = {
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
			ghmix2_scroll_sound
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
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_select_sound
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
			ghmix2_back_sound
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
			menu_pausemenu_in
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
			vol = -8.5
		}
	]
}
ui_unlock_item_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			song_affirmation_02
			vol = -8
		}
		{
			song_affirmation_03
			vol = -8
		}
		{
			song_affirmation_05
			vol = -8
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
			menu_entername_back
			vol = -7
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
			menu_entername_finish_01
			vol = -2
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
pause_menu_exit_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			menu_pausemenu_out
		}
	]
}
colorwheel_highlight_4_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_4
			vol = -5
		}
	]
}
colorwheel_highlight_2_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_2
			vol = -5
		}
	]
}
colorwheel_highlight_3_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_3
			vol = -5
		}
	]
}
colorwheel_highlight_5_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			menu_colorwheel_highlight_up_down_5
			vol = -5
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
			lg_ext_crowd_song_transition
		}
	]
}
md_int_crowd_song_transition_container = {
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_crowd_song_transition
		}
	]
}
ui_sfx_scroll_up_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_scroll_up
			vol = -6
			pitch = 0
		}
	]
}
ui_sfx_scroll_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			menu_scroll_down
			vol = -6
			pitch = 0
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
			pitch = 0
			vol = -4
		}
	]
}
band_lobby_negative_select_container = {
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
			pitch = 0
			vol = -1
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
			vol = -2
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
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
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
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
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
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
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
			vol = -9
			pan1x = -0.5
			pan1y = 1.0
			pan2x = 0.5
			pan2y = 1.0
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
	default_priority = 50
	default_buss = crowd_beds
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = randomnorepeattype
	sounds = [
		{
			guitar_smash_medium_gh4_02
			vol = 3
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			guitar_smash_small_gh4_02
			vol = 3
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
			randompitch = {
				type = randomnorepeatlasttwotype
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
	sounds = [
		{
			band_leader_affirmation
			vol = -4
		}
	]
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
			vol = -7.5
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
			vol = -7
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
			pitch = 0
			vol = 1
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
			pitch = 2
			vol = 12
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
			menu_quickplay_removeallsongs
			pitch = 0
			vol = -8
		}
	]
}
front_end_main_menu_intro_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_main_intro
			vol = -2
		}
	]
}
front_end_main_menu_intro_rears_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
			vol = -80
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
			vol = -80
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
			vol = -11
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
md_ext_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_ext_encore_crowd
			vol = -8
		}
	]
}
lg_ext_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			lg_ext_encore_crowd
			vol = -8
		}
	]
}
md_int_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			md_int_encore_crowd
			vol = -8
		}
	]
}
sm_int_encore_crowd_container = {
	default_priority = 50
	default_buss = encore_loops
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			sm_int_encore_crowd
			vol = -8
		}
	]
}
gigboard_scroll_up_down_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 3
	command = playsound
	randomness = none
	sounds = [
		{
			ui_gigboard_scroll
			vol = -9
		}
	]
}
gigboard_gig_unlock_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gig_unlock
			vol = -3
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
			md_ext_crowd_swell_lg
			vol = -6
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
			md_ext_crowd_swell_md
			vol = -6
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
			md_ext_crowd_swell_sh
			vol = -6
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
countdown_timer_beep_sfx_container = {
	default_priority = 51
	default_buss = front_end
	norepeatfor = 0.0001
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			gh_countdown_timer_sfx
			vol = -7.0
			pitch = 7
		}
	]
}
play_transition_sfx_container = {
	default_priority = 50
	default_buss = crowd_transitions
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = none
}
meter_fade_in_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			meter_fade_in
		}
	]
}
quick_play_clear_one_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			quick_play_clear_one
		}
	]
}
quick_play_clear_all_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			quick_play_clear_all
		}
	]
}
quick_play_choose_song_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			quick_play_choose_song
		}
	]
}
online_ui_team_result_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 2
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_calibration_exit
		}
	]
}
menu_calibration_enter_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_calibration_enter
		}
	]
}
menu_character_restore_defaults_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_character_restore_defaults
		}
	]
}
menu_cheat_incorrect_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_incorrect
		}
	]
}
menu_cheat_correct_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_cheat_correct
		}
	]
}
character_edit_transition_out_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			character_edit_transition_out
		}
	]
}
character_edit_transition_in_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			character_edit_transition_in
		}
	]
}
menu_character_gradient_slider_move_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_character_gradient_slider_move
		}
	]
}
menu_zoomin_text_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomin_text
		}
	]
}
menu_zoomout_text_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			menu_zoomout_text
		}
	]
}
ghtunes_menu_down_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_menu_down
		}
	]
}
ghtunes_menu_up_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			ghtunes_menu_up
		}
	]
}
music_store_buy_song_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			music_store_buy_song
		}
	]
}
leaderboard_song_to_difficulty_transition_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			leaderboard_song_to_difficulty_transition
		}
	]
}
ghmix2_stopsong_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_stopsong_sound
		}
	]
}
ghmix2_scroll_sound_01_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_scroll_sound
		}
	]
}
ghmix2_select_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_select_sound
		}
	]
}
ghmix2_back_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_back_sound
		}
	]
}
ghmix2_startsong_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_startsong_sound
		}
	]
}
ghmix2_scroll_sound_02_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			ghmix2_scroll_sound_02
		}
	]
}
outro_three_stars_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_three_stars
			vol = -6
		}
	]
}
outro_two_stars_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_two_stars
			vol = -6
		}
	]
}
playlist_scroll_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			playlist_scroll
			vol = -17
		}
	]
}
songlist_scroll_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = none
	sounds = [
		{
			playlist_scroll
			vol = -17
		}
	]
}
songlist_to_playlist_switch_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			setlist_to_playlist_select
			vol = -2
		}
	]
}
outro_five_stars_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_five_stars
			vol = -6
		}
	]
}
outro_four_stars_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_four_stars
			vol = -6
		}
	]
}
outro_one_star_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_one_star
			vol = -6
		}
	]
}
sort_songlist_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 6
	command = playsound
	randomness = none
	sounds = [
		{
			songlist_sort_songs
			vol = 6
			pitch = 0
		}
	]
}
star_counter_01_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 15
	command = playsound
	randomness = none
	sounds = [
		{
			star_counter_01
			vol = 7
		}
	]
}
star_counter_02_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			star_counter_02
			vol = -6
		}
	]
}
shredfest_momentum_diff_up_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			shredfest_momentum_difficulty_up
			vol = -3
		}
	]
}
shredfest_momentum_diff_down_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			shredfest_momentum_difficulty_down
			vol = -6
		}
	]
}
audio_options_scroll_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = ignore
	instancelimit = 10
	command = playsound
	randomness = none
	sounds = [
		{
			audio_options_scroll
			vol = -2
		}
	]
}
shredfest_play_suddendeath_dropped_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.01
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			shredfest_player_dropout
			vol = -12.0
		}
	]
}
point_awarded_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			point_awarded
			vol = -6.0
		}
	]
}
band_lobby_leader_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			band_leader_sfx
			vol = -4
		}
	]
}
online_team_switch_affirmation_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 8
	command = playsound
	randomness = none
	sounds = [
		{
			band_leader_sfx
			vol = -4
		}
	]
}
band_lobby_complete_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_complete_sfx
			vol = -1.0
		}
	]
}
freeplay_enter_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			freeplay_enter_sfx
		}
	]
}
car_zoom_in_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			car_zoom_in
			vol = -7
		}
	]
}
outro_six_stars_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			outro_six_stars
		}
	]
}
car_zoom_out_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 5
	command = playsound
	randomness = none
	sounds = [
		{
			car_zoom_out
			vol = -5
		}
	]
}
end_of_song_camera_movement_sound_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
		{
			camera_whoosh_3
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
		{
			camera_whoosh_4
			vol = 0
			pan1x = -1.0
			pan1y = 0.5
			pan2x = 1.0
			pan2y = 0.5
		}
	]
}
jm_menu_scroll_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = randomnorepeattype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jm_menu_back
			vol = -3
		}
	]
}
jm_menu_check_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jm_menu_check
			vol = -3
		}
	]
}
jm_menu_uncheck_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jm_menu_uncheck
			vol = -3
		}
	]
}
jm_menu_select_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			jm_menu_select
			vol = -5
		}
	]
}
jm_menu_finalselect_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			jm_menu_finalselect
			vol = -3
		}
	]
}
jm_menu_loop_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
gh_sfx_you_lose_single_player_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			gh3_sudden_death
			vol = -6.0
		}
	]
}
surge_during_stats_screen_container = {
	default_priority = 50
	default_buss = crowd_cheers
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = randomnorepeatlasttwotype
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
car_widget_select_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			car_widget_select
			vol = -11
		}
	]
}
car_widget_deselect_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			car_widget_deselect
			vol = -8
		}
	]
}
car_widget_scroll_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			car_widget_scroll
		}
	]
}
endofsong_camera_cheer_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = pyro
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 2
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
		{
			pyro_1
			send_vol1 = 9
			randomvol = {
				type = randomrangetype
				vals = [
					-14
					-11
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			pyro_2
			send_vol1 = 9
			randomvol = {
				type = randomrangetype
				vals = [
					-14
					-11
				]
			}
			randompitch = {
				type = randomrangetype
				vals = [
					-1
					1
				]
			}
		}
		{
			pyro_3
			send_vol1 = 9
			randomvol = {
				type = randomrangetype
				vals = [
					-14
					-11
				]
			}
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
you_rock_back_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			you_rock_back
			vol = 2.5
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
you_rock_lfe_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			you_rock_lfe
			lfeonly = true
			lfe_vol = -8.5
		}
	]
}
you_rock_front_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			you_rock_front
			vol = 2.5
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
endofsong_camera_cheer_softer_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			gig_challenge
			vol = -17
		}
	]
}
band_moment_sfx_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			band_moments
			vol = -9
		}
	]
}
gameplay_vote_heaven_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gameplay_vote_heaven
			vol = -5
			pitch = 0
		}
	]
}
gameplay_vote_hell_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gameplay_vote_hell
			vol = -8
			pitch = 0
		}
	]
}
gameplay_spin_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gameplay_spin
			vol = -13
		}
	]
}
gameplay_spin_winner_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gameplay_spin
			vol = -15
			pitch = 2
		}
	]
}
vote_tie_crowd_swell_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			vote_affimation_tie_swell
			vol = -4
		}
	]
}
vote_hell_crowd_swell_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			vote_affimation_hell_swell
			vol = -4
		}
	]
}
vote_heaven_crowd_swell_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			vote_affimation_heaven_swell
		}
	]
}
gameplay_vote_countdown_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.01
	instancemanagement = stop_oldest
	instancelimit = 4
	command = playsound
	randomness = none
	sounds = [
		{
			menu_gameplay_vote_countdown_01
			vol = -3
			pitch = 0
		}
	]
}
endofsong_camera_cheer_quiet_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 4
	command = playsound
	randomness = randomnorepeatlasttwotype
	sounds = [
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
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			beginning_crowd_swell
			vol = -15
		}
	]
}
surge_from_main_to_freeplay_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			crowd_from_main_to_freeplay
			vol = -24
		}
	]
}
bandlineup_scroll_event_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			playsound
			lobbyscroll01
			vol = -5
			pitch = 1
		}
	]
}
0xd6f08335 = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			playsound
			lobbyback06
			vol = -8
		}
	]
}
venue_unlock_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			unlock_venue
			vol = 10
		}
	]
}
online_team_switch_resend_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			team_switch_resend
		}
	]
}
online_team_switch_request_sfx_container = {
	default_priority = 50
	default_buss = front_end
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			team_switch_request
		}
	]
}
band_moment_back_container = {
	default_priority = 50
	default_buss = ui_ingame
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
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
0x28c39a68 = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 5
			pan1x = -1.0
			pan1y = 0
			pan2x = 1.0
			pan2y = 0
		}
	]
}
0xdff6b831 = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
			pan1x = -0.32000002
			pan1y = 0
			pan2x = 0.31
			pan2y = 0
		}
	]
}
0xf53c9e4f = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
			pan1x = -1
			pan1y = 0
			pan2x = -0.37
			pan2y = 0
		}
	]
}
0xc6d5ce68 = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
			pan1x = 0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
0x2f6eb231 = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
			pan1x = -0.25
			pan1y = 0
			pan2x = 1
			pan2y = 0
		}
	]
}
0xeea04f35 = {
	default_priority = 50
	default_buss = 0x2f65de5f
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 20
	command = playsound
	randomness = none
	sounds = [
		{
			star_deployed_back
			vol = 3
			pan1x = -1
			pan1y = 0
			pan2x = 0.25
			pan2y = 0
		}
	]
}
0x6d9ed5f5 = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x85bc7a63
			vol = 8
			pan1x = -1
			pan1y = 1
			pan2x = 1
			pan2y = 1
		}
	]
}
0x5396de87 = {
	default_priority = 50
	default_buss = crowd_one_shots
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
	command = playsound
	randomness = none
	sounds = [
		{
			0x6cd8b292
			vol = 6
			pan1x = -1
			pan1y = -1
			pan2x = 1
			pan2y = -1
		}
	]
}
