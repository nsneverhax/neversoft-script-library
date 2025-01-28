slow_tempo = 75.0
med_tempo = 115.0
fast_tempo = 145.0
short_strum_max_gem_length = 150
med_strum_max_gem_length = 600
strum_anim_lead_time = 250
drum_anim_lead_time = 150
bass_strum_note = 24
always_strum = false
finger_press_blend_time = 0.07
finger_release_blend_time = 0.2
finger_note_padding = 0.01
fret_blend_time = 0.1
drum_blend_time = 0.1
drummer_twist_rate = 0.05
drummer_arm_blend_out_delay = 0.25
drummer_clear_arm_twist_value_delay = 0.0
min_walk_dist = 0.75
max_walk_camera_cut_delay = 1000
normal_walk_data = {
	start_anim = {
		slow = gh3_guitarist_judy_a_med_wlk_start
		med = gh3_guitarist_judy_a_med_wlk_start
		fast = gh3_guitarist_judy_a_med_wlk_start
	}
	cycle_anim = {
		slow = gh3_guitarist_judy_a_med_wlk_loop
		med = gh3_guitarist_judy_a_med_wlk_loop
		fast = gh3_guitarist_judy_a_med_wlk_loop
	}
	stop_left_anim = {
		slow = gh3_guitarist_judy_a_med_wlk_endl
		med = gh3_guitarist_judy_a_med_wlk_endl
		fast = gh3_guitarist_judy_a_med_wlk_endl
	}
	stop_right_anim = {
		slow = gh3_guitarist_judy_a_med_wlk_endr
		med = gh3_guitarist_judy_a_med_wlk_endr
		fast = gh3_guitarist_judy_a_med_wlk_endr
	}
}
default_turn_data = {
	turn_left = gh3_guitarist_judy_a_med_turn_l
	turn_idle = gh3_guitarist_judy_a_med_wlk_inplc
	turn_right = gh3_guitarist_judy_a_med_turn_r
	min_turn = 45
	max_turn = 180
}
normal_strums = {
	no_strum_anim = gh3_hnd_guit_strum_nostrum_01_d
	short = [
		gh3_hnd_guit_strum_norm_s01_d
		gh3_hnd_guit_strum_norm_s02_d
		gh3_hnd_guit_strum_norm_s03_d
		gh3_hnd_guit_strum_norm_s04_d
		gh3_hnd_guit_strum_norm_s05_d
	]
	med = [
		gh3_hnd_guit_strum_norm_m01_d
		gh3_hnd_guit_strum_norm_m02_d
		gh3_hnd_guit_strum_norm_m03_d
	]
	long = [
		gh3_hnd_guit_strum_norm_l01_d
		gh3_hnd_guit_strum_norm_l02_d
	]
}
mute_strums = {
	no_strum_anim = gh3_hnd_guit_strum_nostrum_01_d
	short = [
		gh3_hnd_guit_strum_mute_s01_d
		gh3_hnd_guit_strum_mute_s02_d
		gh3_hnd_guit_strum_mute_s03_d
		gh3_hnd_guit_strum_mute_s04_d
		gh3_hnd_guit_strum_mute_s05_d
	]
	med = [
		gh3_hnd_guit_strum_mute_m01_d
		gh3_hnd_guit_strum_mute_m02_d
		gh3_hnd_guit_strum_mute_m03_d
	]
	long = [
		gh3_hnd_guit_strum_mute_l01_d
	]
}
bad_strums = {
	no_strum_anim = gh3_hnd_guit_strum_nostrum_01_d
	short = [
		gh3_hnd_guit_strum_nostrum_01_d
	]
	med = [
		gh3_hnd_guit_strum_nostrum_01_d
	]
	long = [
		gh3_hnd_guit_strum_nostrum_01_d
	]
}
bass_normal_strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_d
	short = [
		gh3_hnd_bass_strum_strum_01_d
		gh3_hnd_bass_strum_strum_02_d
		gh3_hnd_bass_strum_strum_03_d
	]
	med = [
		gh3_hnd_guit_strum_strum_01_d
		gh3_hnd_guit_strum_strum_02_d
		gh3_hnd_guit_strum_strum_03_d
	]
	long = [
		gh3_hnd_guit_strum_strum_01_d
		gh3_hnd_guit_strum_strum_02_d
		gh3_hnd_guit_strum_strum_03_d
	]
}
bass_pick_strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_d
	short = [
		gh3_hnd_bass_strum_pick_01_d
		gh3_hnd_bass_strum_pick_02_d
		gh3_hnd_bass_strum_pick_03_d
		gh3_hnd_bass_strum_pick_04_d
		gh3_hnd_bass_strum_pick_05_d
		gh3_hnd_bass_strum_pick_06_d
		gh3_hnd_bass_strum_pick_07_d
		gh3_hnd_bass_strum_pick_08_d
	]
	med = [
		gh3_hnd_bass_strum_pick_01_d
		gh3_hnd_bass_strum_pick_02_d
		gh3_hnd_bass_strum_pick_03_d
		gh3_hnd_bass_strum_pick_04_d
		gh3_hnd_bass_strum_pick_05_d
		gh3_hnd_bass_strum_pick_06_d
		gh3_hnd_bass_strum_pick_07_d
		gh3_hnd_bass_strum_pick_08_d
	]
	long = [
		gh3_hnd_bass_strum_pick_01_d
		gh3_hnd_bass_strum_pick_02_d
		gh3_hnd_bass_strum_pick_03_d
		gh3_hnd_bass_strum_pick_04_d
		gh3_hnd_bass_strum_pick_05_d
		gh3_hnd_bass_strum_pick_06_d
		gh3_hnd_bass_strum_pick_07_d
		gh3_hnd_bass_strum_pick_08_d
	]
}
bass_slap_strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_d
	short = [
		gh3_hnd_bass_strum_slap_01_d
		gh3_hnd_bass_strum_slap_02_d
		gh3_hnd_bass_strum_slap_03_d
		gh3_hnd_bass_strum_slap_04_d
		gh3_hnd_bass_strum_slap_05_d
		gh3_hnd_bass_strum_slap_06_d
		gh3_hnd_bass_strum_slap_07_d
		gh3_hnd_bass_strum_slap_08_d
	]
	med = [
		gh3_hnd_bass_strum_slap_01_d
		gh3_hnd_bass_strum_slap_02_d
		gh3_hnd_bass_strum_slap_03_d
		gh3_hnd_bass_strum_slap_04_d
		gh3_hnd_bass_strum_slap_05_d
		gh3_hnd_bass_strum_slap_06_d
		gh3_hnd_bass_strum_slap_07_d
		gh3_hnd_bass_strum_slap_08_d
	]
	long = [
		gh3_hnd_bass_strum_slap_01_d
		gh3_hnd_bass_strum_slap_02_d
		gh3_hnd_bass_strum_slap_03_d
		gh3_hnd_bass_strum_slap_04_d
		gh3_hnd_bass_strum_slap_05_d
		gh3_hnd_bass_strum_slap_06_d
		gh3_hnd_bass_strum_slap_07_d
		gh3_hnd_bass_strum_slap_08_d
	]
}
guitarist_finger_anims_small = {
	green = gh3_hnd_guit_chord_sml_g_d
	red = gh3_hnd_guit_chord_sml_c_d
	yellow = gh3_hnd_guit_chord_sml_a_d
	blue = gh3_hnd_guit_chord_sml_g_d
	orange = gh3_hnd_guit_chord_sml_dsus_d
	green_red = gh3_hnd_guit_chord_sml_g_d
	green_yellow = gh3_hnd_guit_chord_sml_g_d
	green_blue = gh3_hnd_guit_chord_sml_g_d
	green_orange = gh3_hnd_guit_chord_sml_g_d
	red_yellow = gh3_hnd_guit_chord_sml_g_d
	red_blue = gh3_hnd_guit_chord_sml_g_d
	red_orange = gh3_hnd_guit_chord_sml_g_d
	yellow_blue = gh3_hnd_guit_chord_sml_g_d
	yellow_orange = gh3_hnd_guit_chord_sml_g_d
	blue_orange = gh3_hnd_guit_chord_sml_g_d
	green_red_yellow = gh3_hnd_guit_chord_sml_g_d
	green_red_blue = gh3_hnd_guit_chord_sml_g_d
	green_red_orange = gh3_hnd_guit_chord_sml_g_d
	green_yellow_blue = gh3_hnd_guit_chord_sml_g_d
	green_yellow_orange = gh3_hnd_guit_chord_sml_g_d
	green_blue_orange = gh3_hnd_guit_chord_sml_g_d
	red_yellow_blue = gh3_hnd_guit_chord_sml_g_d
	red_yellow_orange = gh3_hnd_guit_chord_sml_g_d
	red_blue_orange = gh3_hnd_guit_chord_sml_g_d
	yellow_blue_orange = gh3_hnd_guit_chord_sml_g_d
	green_red_yellow_blue = gh3_hnd_guit_chord_sml_g_d
	green_red_yellow_orange = gh3_hnd_guit_chord_sml_g_d
	green_red_blue_orange = gh3_hnd_guit_chord_sml_g_d
	green_yellow_blue_orange = gh3_hnd_guit_chord_sml_g_d
	green_red_yellow_blue_orange = gh3_hnd_guit_chord_sml_g_d
	none = gh3_hnd_guit_chord_sml_empty_d
	track_none = gh3_hnd_guit_chord_sml_empty_d
}
guitarist_finger_anims_medium = {
	green = gh3_hnd_guit_chord_lrg_g_d
	red = gh3_hnd_guit_chord_lrg_c_d
	yellow = gh3_hnd_guit_chord_lrg_a_d
	blue = gh3_hnd_guit_chord_lrg_g_d
	orange = gh3_hnd_guit_chord_lrg_dsus_d
	green_red = gh3_hnd_guit_chord_lrg_g_d
	green_yellow = gh3_hnd_guit_chord_lrg_g_d
	green_blue = gh3_hnd_guit_chord_lrg_g_d
	green_orange = gh3_hnd_guit_chord_lrg_g_d
	red_yellow = gh3_hnd_guit_chord_lrg_g_d
	red_blue = gh3_hnd_guit_chord_lrg_g_d
	red_orange = gh3_hnd_guit_chord_lrg_g_d
	yellow_blue = gh3_hnd_guit_chord_lrg_g_d
	yellow_orange = gh3_hnd_guit_chord_lrg_g_d
	blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow = gh3_hnd_guit_chord_lrg_g_d
	green_red_blue = gh3_hnd_guit_chord_lrg_g_d
	green_red_orange = gh3_hnd_guit_chord_lrg_g_d
	green_yellow_blue = gh3_hnd_guit_chord_lrg_g_d
	green_yellow_orange = gh3_hnd_guit_chord_lrg_g_d
	green_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	red_yellow_blue = gh3_hnd_guit_chord_lrg_g_d
	red_yellow_orange = gh3_hnd_guit_chord_lrg_g_d
	red_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	yellow_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow_blue = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_yellow_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	none = gh3_hnd_guit_chord_lrg_empty_d
	track_none = gh3_hnd_guit_chord_lrg_empty_d
}
guitarist_finger_anims_large = {
	green = gh3_hnd_guit_chord_lrg_roll3_1_d
	red = gh3_hnd_guit_chord_lrg_roll3_2_d
	yellow = gh3_hnd_guit_chord_lrg_roll3_3_d
	blue = gh3_hnd_guit_chord_lrg_roll3_4_d
	orange = gh3_hnd_guit_chord_lrg_roll3_4_d
	green_red = gh3_hnd_guit_chord_lrg_bar2_d
	green_yellow = gh3_hnd_guit_chord_lrg_bar3_d
	green_blue = gh3_hnd_guit_chord_lrg_bar4_d
	green_orange = gh3_hnd_guit_chord_lrg_g_d
	red_yellow = gh3_hnd_guit_chord_lrg_bar2_d
	red_blue = gh3_hnd_guit_chord_lrg_bar3_d
	red_orange = gh3_hnd_guit_chord_lrg_bar4_d
	yellow_blue = gh3_hnd_guit_chord_lrg_bar2_d
	yellow_orange = gh3_hnd_guit_chord_lrg_bar3_d
	blue_orange = gh3_hnd_guit_chord_lrg_bar2_d
	green_red_yellow = gh3_hnd_guit_chord_lrg_bar1_d
	green_red_blue = gh3_hnd_guit_chord_lrg_bar5_d
	green_red_orange = gh3_hnd_guit_chord_lrg_g_d
	green_yellow_blue = gh3_hnd_guit_chord_lrg_bar5_d
	green_yellow_orange = gh3_hnd_guit_chord_lrg_bar5_d
	green_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	red_yellow_blue = gh3_hnd_guit_chord_lrg_bar1_d
	red_yellow_orange = gh3_hnd_guit_chord_lrg_bar5_d
	red_blue_orange = gh3_hnd_guit_chord_lrg_bar5_d
	yellow_blue_orange = gh3_hnd_guit_chord_lrg_bar1_d
	green_red_yellow_blue = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_yellow_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	green_red_yellow_blue_orange = gh3_hnd_guit_chord_lrg_g_d
	none = gh3_hnd_guit_chord_lrg_empty_d
	track_none = gh3_hnd_guit_chord_lrg_empty_d
}
fret_anims = {
	track_127 = gh3_hnd_guit_fret_med_01_d
	track_126 = gh3_hnd_guit_fret_med_03_d
	track_125 = gh3_hnd_guit_fret_med_05_d
	track_124 = gh3_hnd_guit_fret_med_07_d
	track_123 = gh3_hnd_guit_fret_med_09_d
	track_122 = gh3_hnd_guit_fret_med_11_d
	track_121 = gh3_hnd_guit_fret_med_13_d
	track_120 = gh3_hnd_guit_fret_med_15_d
	track_119 = gh3_hnd_guit_fret_med_17_d
	track_118 = gh3_hnd_guit_fret_med_18_d
	track_110 = gh3_hnd_guit_fret_01_d
	track_109 = gh3_hnd_guit_fret_03_d
	track_108 = gh3_hnd_guit_fret_05_d
	track_107 = gh3_hnd_guit_fret_07_d
	track_106 = gh3_hnd_guit_fret_09_d
	track_105 = gh3_hnd_guit_fret_11_d
	track_104 = gh3_hnd_guit_fret_13_d
	track_103 = gh3_hnd_guit_fret_15_d
	track_102 = gh3_hnd_guit_fret_17_d
	track_101 = gh3_hnd_guit_fret_18_d
}
fret_anims_sml = {
	track_127 = gh3_hnd_guit_fret_sml_01_d
	track_126 = gh3_hnd_guit_fret_sml_03_d
	track_125 = gh3_hnd_guit_fret_sml_05_d
	track_124 = gh3_hnd_guit_fret_sml_07_d
	track_123 = gh3_hnd_guit_fret_sml_09_d
	track_122 = gh3_hnd_guit_fret_sml_11_d
	track_121 = gh3_hnd_guit_fret_sml_13_d
	track_120 = gh3_hnd_guit_fret_sml_15_d
	track_119 = gh3_hnd_guit_fret_sml_17_d
	track_118 = gh3_hnd_guit_fret_sml_18_d
	track_110 = gh3_hnd_guit_fret_01_d
	track_109 = gh3_hnd_guit_fret_03_d
	track_108 = gh3_hnd_guit_fret_05_d
	track_107 = gh3_hnd_guit_fret_07_d
	track_106 = gh3_hnd_guit_fret_09_d
	track_105 = gh3_hnd_guit_fret_11_d
	track_104 = gh3_hnd_guit_fret_13_d
	track_103 = gh3_hnd_guit_fret_15_d
	track_102 = gh3_hnd_guit_fret_17_d
	track_101 = gh3_hnd_guit_fret_18_d
}
fret_anims_med = {
	track_127 = gh3_hnd_guit_fret_med_01_d
	track_126 = gh3_hnd_guit_fret_med_03_d
	track_125 = gh3_hnd_guit_fret_med_05_d
	track_124 = gh3_hnd_guit_fret_med_07_d
	track_123 = gh3_hnd_guit_fret_med_09_d
	track_122 = gh3_hnd_guit_fret_med_11_d
	track_121 = gh3_hnd_guit_fret_med_13_d
	track_120 = gh3_hnd_guit_fret_med_15_d
	track_119 = gh3_hnd_guit_fret_med_17_d
	track_118 = gh3_hnd_guit_fret_med_18_d
	track_110 = gh3_hnd_guit_fret_01_d
	track_109 = gh3_hnd_guit_fret_03_d
	track_108 = gh3_hnd_guit_fret_05_d
	track_107 = gh3_hnd_guit_fret_07_d
	track_106 = gh3_hnd_guit_fret_09_d
	track_105 = gh3_hnd_guit_fret_11_d
	track_104 = gh3_hnd_guit_fret_13_d
	track_103 = gh3_hnd_guit_fret_15_d
	track_102 = gh3_hnd_guit_fret_17_d
	track_101 = gh3_hnd_guit_fret_18_d
}
fret_anims_lrg = {
	track_127 = gh3_hnd_guit_fret_lrg_01_d
	track_126 = gh3_hnd_guit_fret_lrg_03_d
	track_125 = gh3_hnd_guit_fret_lrg_05_d
	track_124 = gh3_hnd_guit_fret_lrg_07_d
	track_123 = gh3_hnd_guit_fret_lrg_09_d
	track_122 = gh3_hnd_guit_fret_lrg_11_d
	track_121 = gh3_hnd_guit_fret_lrg_13_d
	track_120 = gh3_hnd_guit_fret_lrg_15_d
	track_119 = gh3_hnd_guit_fret_lrg_17_d
	track_118 = gh3_hnd_guit_fret_lrg_18_d
	track_110 = gh3_hnd_guit_fret_01_d
	track_109 = gh3_hnd_guit_fret_03_d
	track_108 = gh3_hnd_guit_fret_05_d
	track_107 = gh3_hnd_guit_fret_07_d
	track_106 = gh3_hnd_guit_fret_09_d
	track_105 = gh3_hnd_guit_fret_11_d
	track_104 = gh3_hnd_guit_fret_13_d
	track_103 = gh3_hnd_guit_fret_15_d
	track_102 = gh3_hnd_guit_fret_17_d
	track_101 = gh3_hnd_guit_fret_18_d
}
drummer_animations = {
	stance_a = {
		idle = {
			good = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
				]
			}
			normal = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
				]
			}
			bad = {
				fast = [
					gh3_drummer_fst_idle_01
					gh3_drummer_fst_idle_02
				]
				med = [
					gh3_drummer_med_idle_01
					gh3_drummer_med_idle_02
				]
				slow = [
					gh3_drummer_slw_idle_01
					gh3_drummer_slw_idle_02
				]
			}
		}
		sticks = {
			good = {
				fast = [
					test_drum_1234
				]
				med = [
					test_drum_1234
				]
				slow = [
					test_drum_12342
				]
			}
			normal = {
				fast = [
					test_drum_1234
				]
				med = [
					test_drum_1234
				]
				slow = [
					test_drum_1234
				]
			}
			bad = {
				fast = [
					test_drum_1234
				]
				med = [
					test_drum_1234
				]
				slow = [
					test_drum_1234
				]
			}
		}
		transitions = {
		}
	}
	intro = {
		idle = {
			good = {
				fast = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				med = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				slow = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
			}
			normal = {
				fast = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				med = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				slow = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
			}
			bad = {
				fast = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				med = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
				slow = [
					gh3_drummer_intro01
					gh3_drummer_intro02
				]
			}
		}
		transitions = {
		}
	}
	win = {
		idle = {
			good = {
				fast = [
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
				med = [
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
				slow = [
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
			}
			normal = {
				fast = [
					gh3_drummer_win_01
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
				med = [
					gh3_drummer_win_01
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
				slow = [
					gh3_drummer_win_01
					gh3_drummer_win_02
					gh3_drummer_win_03
				]
			}
			bad = {
				fast = [
					gh3_drummer_win_01
				]
				med = [
					gh3_drummer_win_01
				]
				slow = [
					gh3_drummer_win_01
				]
			}
		}
		transitions = {
		}
	}
	lose = {
		idle = {
			good = {
				fast = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				med = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				slow = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
			}
			normal = {
				fast = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				med = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				slow = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
			}
			bad = {
				fast = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				med = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
				slow = [
					gh3_drummer_lose_01
					gh3_drummer_lose_02
				]
			}
		}
		transitions = {
		}
	}
}
crowd_animations = {
	idle = {
		good = {
			fast = [
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_cheer1
				gh3_crowd_clapping1
			]
			med = [
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_cheer1
				gh3_crowd_clapping1
			]
			slow = [
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping2
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_jumping3
				gh3_crowd_cheer1
				gh3_crowd_clapping1
			]
		}
		normal = {
			fast = [
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_jumping1
				gh3_crowd_clapping1
			]
			med = [
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_jumping1
				gh3_crowd_clapping1
			]
			slow = [
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer1
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_cheer2
				gh3_crowd_jumping1
				gh3_crowd_clapping1
			]
		}
		bad = {
			fast = [
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_cheer1
				gh3_crowd_jumping1
			]
			med = [
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_cheer1
				gh3_crowd_jumping1
			]
			slow = [
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping1
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_clapping2
				gh3_crowd_cheer1
				gh3_crowd_jumping1
			]
		}
	}
	clapping = {
		good = {
			fast = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			med = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			slow = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
		}
		normal = {
			fast = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			med = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			slow = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
		}
		bad = {
			fast = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			med = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
			slow = [
				gh3_crowd_clapping1
				gh3_crowd_clapping2
			]
		}
	}
	jumping = {
		good = {
			fast = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			med = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			slow = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
		}
		normal = {
			fast = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			med = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			slow = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
		}
		bad = {
			fast = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			med = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
			slow = [
				gh3_crowd_jumping1
				gh3_crowd_jumping2
				gh3_crowd_jumping3
			]
		}
	}
	cheering = {
		good = {
			fast = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			med = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			slow = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
		}
		normal = {
			fast = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			med = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			slow = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
		}
		bad = {
			fast = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			med = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
			slow = [
				gh3_crowd_cheer1
				gh3_crowd_cheer2
			]
		}
	}
}
drum_sets = {
	artdeco = drum_kit001
	wikker = drum_kit002
	budokan = drum_kit003
	`default` = drum_kit001
}
drummer_anims = {
	track_36 = [
		test_drum_kick
	]
	track_37 = [
		test_drum_hittom3_l
	]
	track_38 = [
		test_drum_hittom2_l
	]
	track_39 = [
		test_drum_hittom1_l
	]
	track_40 = [
		test_drum_hitsnare_l
	]
	track_41 = [
		test_drum_hithat_l
	]
	track_42 = [
		test_drum_hithat_l
	]
	track_43 = [
		test_drum_hitcym3_l
	]
	track_44 = [
		test_drum_hitcym1_l
	]
	track_45 = [
		test_drum_hitcym2_l
	]
	track_48 = [
		test_drum_kick
	]
	track_49 = [
		test_drum_hittom3_r
	]
	track_50 = [
		test_drum_hittom2_r
	]
	track_51 = [
		test_drum_hittom1_r
	]
	track_52 = [
		test_drum_hitsnare_r
	]
	track_53 = [
		test_drum_hithat_r
	]
	track_54 = [
		test_drum_hithat_r
	]
	track_55 = [
		test_drum_hitcym3_r
	]
	track_56 = [
		test_drum_hitcym1_r
	]
	track_57 = [
		test_drum_hitcym2_r
	]
	sticktap_l = gh3_drummer_hitsticks_l
	sticktap_r = gh3_drummer_hitsticks_r
	stickdown_l = gh3_drummer_sticksdownl
	stickdown_r = gh3_drummer_sticksdownr
}
drummer_left_arm_twist_factors = {
	track_37 = 0.9
	track_38 = 0.5
	track_39 = 0.35000002
	track_40 = 0.35000002
	track_41 = 0.0
	track_42 = 0.0
	track_43 = 0.0
	track_44 = 0.0
	track_45 = 0.95
}
drummer_right_arm_twist_factors = {
	track_49 = 0.9
	track_50 = 0.4
	track_51 = 0.0
	track_52 = 0.0
	track_53 = 0.0
	track_54 = 0.0
	track_55 = 1.0
	track_56 = 0.0
	track_57 = 0.95
}
cymbal_anims = [
	test_drum_cymbal_1
	test_drum_cymbal_2
	test_drum_cymbal_3
	test_drum_cymbal_hh
]
player1_battlemode_anims = {
	lightning = {
		attack_anim = attack
		response_anim = react_right
	}
	difficultyup = {
		attack_anim = attack
		response_anim = react_right
	}
	doublenotes = {
		attack_anim = attack
		response_anim = react_right
	}
	powerupsteal = {
		attack_anim = attack
		response_anim = react_right
	}
	leftynotes = {
		attack_anim = attack
		response_anim = react_right
	}
	brokenstring = {
		attack_anim = attack
		response_anim = react_right
	}
	whammyattack = {
		attack_anim = attack
		response_anim = react_right
	}
}
player2_battlemode_anims = {
	lightning = {
		attack_anim = attack_right
		response_anim = react
	}
	difficultyup = {
		attack_anim = attack_right
		response_anim = react
	}
	doublenotes = {
		attack_anim = attack_right
		response_anim = react
	}
	powerupsteal = {
		attack_anim = attack_right
		response_anim = react
	}
	leftynotes = {
		attack_anim = attack_right
		response_anim = react
	}
	brokenstring = {
		attack_anim = attack_right
		response_anim = react
	}
	whammyattack = {
		attack_anim = attack_right
		response_anim = react
	}
}
