slow_tempo = 75.0
med_tempo = 115.0
fast_tempo = 145.0
short_strum_max_gem_length = 150
med_strum_max_gem_length = 600
strum_anim_lead_time = 250
drum_anim_lead_time = 150
bass_strum_note = 24
always_strum = FALSE
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
		SLOW = GH3_Guitarist_Judy_A_Med_Wlk_Start
		Med = GH3_Guitarist_Judy_A_Med_Wlk_Start
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_Start
	}
	cycle_anim = {
		SLOW = GH3_Guitarist_Judy_A_Med_Wlk_Loop
		Med = GH3_Guitarist_Judy_A_Med_Wlk_Loop
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_Loop
	}
	stop_left_anim = {
		SLOW = GH3_Guitarist_Judy_A_Med_Wlk_EndL
		Med = GH3_Guitarist_Judy_A_Med_Wlk_EndL
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_EndL
	}
	stop_right_anim = {
		SLOW = GH3_Guitarist_Judy_A_Med_Wlk_EndR
		Med = GH3_Guitarist_Judy_A_Med_Wlk_EndR
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_EndR
	}
}
default_turn_data = {
	turn_left = GH3_Guitarist_Judy_A_Med_Turn_L
	turn_idle = GH3_Guitarist_Judy_A_Med_Wlk_inPlc
	turn_right = GH3_Guitarist_Judy_A_Med_Turn_R
	min_turn = 45
	max_turn = 180
}
Normal_Strums = {
	no_strum_anim = GH3_Hnd_Guit_Strum_NoStrum_01_D
	Short = [
		GH3_Hnd_Guit_Strum_Norm_S01_D
		GH3_Hnd_Guit_Strum_Norm_S02_D
		GH3_Hnd_Guit_Strum_Norm_S03_D
		GH3_Hnd_Guit_Strum_Norm_S04_D
		GH3_Hnd_Guit_Strum_Norm_S05_D
	]
	Med = [
		GH3_Hnd_Guit_Strum_Norm_M01_D
		GH3_Hnd_Guit_Strum_Norm_M02_D
		GH3_Hnd_Guit_Strum_Norm_M03_D
	]
	Long = [
		GH3_Hnd_Guit_Strum_Norm_L01_D
		GH3_Hnd_Guit_Strum_Norm_L02_D
	]
}
Mute_Strums = {
	no_strum_anim = GH3_Hnd_Guit_Strum_NoStrum_01_D
	Short = [
		GH3_Hnd_Guit_Strum_Mute_S01_D
		GH3_Hnd_Guit_Strum_Mute_S02_D
		GH3_Hnd_Guit_Strum_Mute_S03_D
		GH3_Hnd_Guit_Strum_Mute_S04_D
		GH3_Hnd_Guit_Strum_Mute_S05_D
	]
	Med = [
		GH3_Hnd_Guit_Strum_Mute_M01_D
		GH3_Hnd_Guit_Strum_Mute_M02_D
		GH3_Hnd_Guit_Strum_Mute_M03_D
	]
	Long = [
		GH3_Hnd_Guit_Strum_Mute_L01_D
	]
}
Bad_Strums = {
	no_strum_anim = GH3_Hnd_Guit_Strum_NoStrum_01_D
	Short = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
	Med = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
	Long = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
}
Bass_Normal_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
	Short = [
		gh3_hnd_bass_strum_strum_01_d
		gh3_hnd_bass_strum_strum_02_d
		gh3_hnd_bass_strum_strum_03_d
	]
	Med = [
		GH3_Hnd_Guit_Strum_strum_01_D
		GH3_Hnd_Guit_Strum_strum_02_D
		GH3_Hnd_Guit_Strum_strum_03_D
	]
	Long = [
		GH3_Hnd_Guit_Strum_strum_01_D
		GH3_Hnd_Guit_Strum_strum_02_D
		GH3_Hnd_Guit_Strum_strum_03_D
	]
}
Bass_Pick_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
	Short = [
		gh3_hnd_bass_strum_pick_01_d
		gh3_hnd_bass_strum_pick_02_d
		gh3_hnd_bass_strum_pick_03_d
		gh3_hnd_bass_strum_pick_04_d
		gh3_hnd_bass_strum_pick_05_d
		gh3_hnd_bass_strum_pick_06_d
		gh3_hnd_bass_strum_pick_07_d
		gh3_hnd_bass_strum_pick_08_d
	]
	Med = [
		gh3_hnd_bass_strum_pick_01_d
		gh3_hnd_bass_strum_pick_02_d
		gh3_hnd_bass_strum_pick_03_d
		gh3_hnd_bass_strum_pick_04_d
		gh3_hnd_bass_strum_pick_05_d
		gh3_hnd_bass_strum_pick_06_d
		gh3_hnd_bass_strum_pick_07_d
		gh3_hnd_bass_strum_pick_08_d
	]
	Long = [
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
Bass_Slap_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
	Short = [
		gh3_hnd_bass_strum_slap_01_d
		gh3_hnd_bass_strum_slap_02_d
		gh3_hnd_bass_strum_slap_03_d
		gh3_hnd_bass_strum_slap_04_d
		gh3_hnd_bass_strum_slap_05_d
		gh3_hnd_bass_strum_slap_06_d
		gh3_hnd_bass_strum_slap_07_d
		gh3_hnd_bass_strum_slap_08_d
	]
	Med = [
		gh3_hnd_bass_strum_slap_01_d
		gh3_hnd_bass_strum_slap_02_d
		gh3_hnd_bass_strum_slap_03_d
		gh3_hnd_bass_strum_slap_04_d
		gh3_hnd_bass_strum_slap_05_d
		gh3_hnd_bass_strum_slap_06_d
		gh3_hnd_bass_strum_slap_07_d
		gh3_hnd_bass_strum_slap_08_d
	]
	Long = [
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
	Green = GH3_Hnd_Guit_Chord_SML_G_D
	RED = GH3_Hnd_Guit_Chord_SML_C_D
	Yellow = GH3_Hnd_Guit_Chord_SML_A_D
	BLUE = GH3_Hnd_Guit_Chord_SML_G_D
	Orange = GH3_Hnd_Guit_Chord_SML_DSUS_D
	green_red = GH3_Hnd_Guit_Chord_SML_G_D
	green_yellow = GH3_Hnd_Guit_Chord_SML_G_D
	green_blue = GH3_Hnd_Guit_Chord_SML_G_D
	green_orange = GH3_Hnd_Guit_Chord_SML_G_D
	red_yellow = GH3_Hnd_Guit_Chord_SML_G_D
	red_blue = GH3_Hnd_Guit_Chord_SML_G_D
	red_orange = GH3_Hnd_Guit_Chord_SML_G_D
	yellow_blue = GH3_Hnd_Guit_Chord_SML_G_D
	yellow_orange = GH3_Hnd_Guit_Chord_SML_G_D
	blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_yellow = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_blue = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_yellow_blue = GH3_Hnd_Guit_Chord_SML_G_D
	green_yellow_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	red_yellow_blue = GH3_Hnd_Guit_Chord_SML_G_D
	red_yellow_orange = GH3_Hnd_Guit_Chord_SML_G_D
	red_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	yellow_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_yellow_blue = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_yellow_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_yellow_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	green_red_yellow_blue_orange = GH3_Hnd_Guit_Chord_SML_G_D
	NONE = Gh3_hnd_guit_chord_SML_Empty_D
	track_none = Gh3_hnd_guit_chord_SML_Empty_D
}
guitarist_finger_anims_medium = {
	Green = GH3_Hnd_Guit_Chord_LRG_G_D
	RED = GH3_Hnd_Guit_Chord_LRG_C_D
	Yellow = GH3_Hnd_Guit_Chord_LRG_A_D
	BLUE = GH3_Hnd_Guit_Chord_LRG_G_D
	Orange = GH3_Hnd_Guit_Chord_LRG_DSUS_D
	green_red = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow = GH3_Hnd_Guit_Chord_LRG_G_D
	green_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	green_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	red_yellow = GH3_Hnd_Guit_Chord_LRG_G_D
	red_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	red_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	yellow_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	yellow_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	red_yellow_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	red_yellow_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	red_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	NONE = Gh3_hnd_guit_chord_LRG_Empty_D
	track_none = Gh3_hnd_guit_chord_LRG_Empty_D
}
guitarist_finger_anims_large = {
	Green = GH3_Hnd_Guit_Chord_LRG_Roll3_1_D
	RED = GH3_Hnd_Guit_Chord_LRG_Roll3_2_D
	Yellow = GH3_Hnd_Guit_Chord_LRG_Roll3_3_D
	BLUE = GH3_Hnd_Guit_Chord_LRG_Roll3_4_D
	Orange = GH3_Hnd_Guit_Chord_LRG_Roll3_4_D
	green_red = GH3_Hnd_Guit_Chord_LRG_Bar2_D
	green_yellow = GH3_Hnd_Guit_Chord_LRG_Bar3_D
	green_blue = GH3_Hnd_Guit_Chord_LRG_Bar4_D
	green_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	red_yellow = GH3_Hnd_Guit_Chord_LRG_Bar2_D
	red_blue = GH3_Hnd_Guit_Chord_LRG_Bar3_D
	red_orange = GH3_Hnd_Guit_Chord_LRG_Bar4_D
	yellow_blue = GH3_Hnd_Guit_Chord_LRG_Bar2_D
	yellow_orange = GH3_Hnd_Guit_Chord_LRG_Bar3_D
	blue_orange = GH3_Hnd_Guit_Chord_LRG_Bar2_D
	green_red_yellow = GH3_Hnd_Guit_Chord_LRG_Bar1_D
	green_red_blue = GH3_Hnd_Guit_Chord_LRG_Bar5_D
	green_red_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow_blue = GH3_Hnd_Guit_Chord_LRG_Bar5_D
	green_yellow_orange = GH3_Hnd_Guit_Chord_LRG_Bar5_D
	green_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	red_yellow_blue = GH3_Hnd_Guit_Chord_LRG_Bar1_D
	red_yellow_orange = GH3_Hnd_Guit_Chord_LRG_Bar5_D
	red_blue_orange = GH3_Hnd_Guit_Chord_LRG_Bar5_D
	yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_Bar1_D
	green_red_yellow_blue = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	green_red_yellow_blue_orange = GH3_Hnd_Guit_Chord_LRG_G_D
	NONE = Gh3_hnd_guit_chord_LRG_Empty_D
	track_none = Gh3_hnd_guit_chord_LRG_Empty_D
}
fret_anims = {
	track_127 = GH3_Hnd_Guit_Fret_Med_01_D
	track_126 = GH3_Hnd_Guit_Fret_Med_03_D
	track_125 = GH3_Hnd_Guit_Fret_Med_05_D
	track_124 = GH3_Hnd_Guit_Fret_Med_07_D
	track_123 = GH3_Hnd_Guit_Fret_Med_09_D
	track_122 = GH3_Hnd_Guit_Fret_Med_11_D
	track_121 = GH3_Hnd_Guit_Fret_Med_13_D
	track_120 = GH3_Hnd_Guit_Fret_Med_15_D
	track_119 = GH3_Hnd_Guit_Fret_Med_17_D
	track_118 = GH3_Hnd_Guit_Fret_Med_18_D
	track_110 = GH3_Hnd_Guit_Fret_01_D
	track_109 = GH3_Hnd_Guit_Fret_03_D
	track_108 = GH3_Hnd_Guit_Fret_05_D
	track_107 = GH3_Hnd_Guit_Fret_07_D
	track_106 = GH3_Hnd_Guit_Fret_09_D
	track_105 = GH3_Hnd_Guit_Fret_11_D
	track_104 = GH3_Hnd_Guit_Fret_13_D
	track_103 = GH3_Hnd_Guit_Fret_15_D
	track_102 = GH3_Hnd_Guit_Fret_17_D
	track_101 = GH3_Hnd_Guit_Fret_18_D
}
fret_anims_sml = {
	track_127 = GH3_Hnd_Guit_Fret_Sml_01_D
	track_126 = GH3_Hnd_Guit_Fret_Sml_03_D
	track_125 = GH3_Hnd_Guit_Fret_Sml_05_D
	track_124 = GH3_Hnd_Guit_Fret_Sml_07_D
	track_123 = GH3_Hnd_Guit_Fret_Sml_09_D
	track_122 = GH3_Hnd_Guit_Fret_Sml_11_D
	track_121 = GH3_Hnd_Guit_Fret_Sml_13_D
	track_120 = GH3_Hnd_Guit_Fret_Sml_15_D
	track_119 = GH3_Hnd_Guit_Fret_Sml_17_D
	track_118 = GH3_Hnd_Guit_Fret_Sml_18_D
	track_110 = GH3_Hnd_Guit_Fret_01_D
	track_109 = GH3_Hnd_Guit_Fret_03_D
	track_108 = GH3_Hnd_Guit_Fret_05_D
	track_107 = GH3_Hnd_Guit_Fret_07_D
	track_106 = GH3_Hnd_Guit_Fret_09_D
	track_105 = GH3_Hnd_Guit_Fret_11_D
	track_104 = GH3_Hnd_Guit_Fret_13_D
	track_103 = GH3_Hnd_Guit_Fret_15_D
	track_102 = GH3_Hnd_Guit_Fret_17_D
	track_101 = GH3_Hnd_Guit_Fret_18_D
}
fret_anims_med = {
	track_127 = GH3_Hnd_Guit_Fret_Med_01_D
	track_126 = GH3_Hnd_Guit_Fret_Med_03_D
	track_125 = GH3_Hnd_Guit_Fret_Med_05_D
	track_124 = GH3_Hnd_Guit_Fret_Med_07_D
	track_123 = GH3_Hnd_Guit_Fret_Med_09_D
	track_122 = GH3_Hnd_Guit_Fret_Med_11_D
	track_121 = GH3_Hnd_Guit_Fret_Med_13_D
	track_120 = GH3_Hnd_Guit_Fret_Med_15_D
	track_119 = GH3_Hnd_Guit_Fret_Med_17_D
	track_118 = GH3_Hnd_Guit_Fret_Med_18_D
	track_110 = GH3_Hnd_Guit_Fret_01_D
	track_109 = GH3_Hnd_Guit_Fret_03_D
	track_108 = GH3_Hnd_Guit_Fret_05_D
	track_107 = GH3_Hnd_Guit_Fret_07_D
	track_106 = GH3_Hnd_Guit_Fret_09_D
	track_105 = GH3_Hnd_Guit_Fret_11_D
	track_104 = GH3_Hnd_Guit_Fret_13_D
	track_103 = GH3_Hnd_Guit_Fret_15_D
	track_102 = GH3_Hnd_Guit_Fret_17_D
	track_101 = GH3_Hnd_Guit_Fret_18_D
}
fret_anims_lrg = {
	track_127 = GH3_Hnd_Guit_Fret_Lrg_01_D
	track_126 = GH3_Hnd_Guit_Fret_Lrg_03_D
	track_125 = GH3_Hnd_Guit_Fret_Lrg_05_D
	track_124 = GH3_Hnd_Guit_Fret_Lrg_07_D
	track_123 = GH3_Hnd_Guit_Fret_Lrg_09_D
	track_122 = GH3_Hnd_Guit_Fret_Lrg_11_D
	track_121 = GH3_Hnd_Guit_Fret_Lrg_13_D
	track_120 = GH3_Hnd_Guit_Fret_Lrg_15_D
	track_119 = GH3_Hnd_Guit_Fret_Lrg_17_D
	track_118 = GH3_Hnd_Guit_Fret_Lrg_18_D
	track_110 = GH3_Hnd_Guit_Fret_01_D
	track_109 = GH3_Hnd_Guit_Fret_03_D
	track_108 = GH3_Hnd_Guit_Fret_05_D
	track_107 = GH3_Hnd_Guit_Fret_07_D
	track_106 = GH3_Hnd_Guit_Fret_09_D
	track_105 = GH3_Hnd_Guit_Fret_11_D
	track_104 = GH3_Hnd_Guit_Fret_13_D
	track_103 = GH3_Hnd_Guit_Fret_15_D
	track_102 = GH3_Hnd_Guit_Fret_17_D
	track_101 = GH3_Hnd_Guit_Fret_18_D
}
drummer_animations = {
	Stance_A = {
		IDLE = {
			GOOD = {
				FAST = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
				]
				Med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
				]
				SLOW = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
				]
			}
			Normal = {
				FAST = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
				]
				Med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
				]
				SLOW = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
				]
			}
			Bad = {
				FAST = [
					GH3_Drummer_Fst_Idle_01
					GH3_Drummer_Fst_Idle_02
				]
				Med = [
					GH3_Drummer_Med_Idle_01
					GH3_Drummer_Med_Idle_02
				]
				SLOW = [
					GH3_Drummer_Slw_Idle_01
					GH3_Drummer_Slw_Idle_02
				]
			}
		}
		Sticks = {
			GOOD = {
				FAST = [
					Test_Drum_1234
				]
				Med = [
					Test_Drum_1234
				]
				SLOW = [
					Test_Drum_12342
				]
			}
			Normal = {
				FAST = [
					Test_Drum_1234
				]
				Med = [
					Test_Drum_1234
				]
				SLOW = [
					Test_Drum_1234
				]
			}
			Bad = {
				FAST = [
					Test_Drum_1234
				]
				Med = [
					Test_Drum_1234
				]
				SLOW = [
					Test_Drum_1234
				]
			}
		}
		Transitions = {
		}
	}
	INTRO = {
		IDLE = {
			GOOD = {
				FAST = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				Med = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				SLOW = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
			}
			Normal = {
				FAST = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				Med = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				SLOW = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
			}
			Bad = {
				FAST = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				Med = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
				SLOW = [
					GH3_Drummer_Intro01
					GH3_Drummer_Intro02
				]
			}
		}
		Transitions = {
		}
	}
	WIN = {
		IDLE = {
			GOOD = {
				FAST = [
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
				Med = [
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
				SLOW = [
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
			}
			Normal = {
				FAST = [
					GH3_Drummer_Win_01
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
				Med = [
					GH3_Drummer_Win_01
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
				SLOW = [
					GH3_Drummer_Win_01
					GH3_Drummer_Win_02
					GH3_Drummer_Win_03
				]
			}
			Bad = {
				FAST = [
					GH3_Drummer_Win_01
				]
				Med = [
					GH3_Drummer_Win_01
				]
				SLOW = [
					GH3_Drummer_Win_01
				]
			}
		}
		Transitions = {
		}
	}
	LOSE = {
		IDLE = {
			GOOD = {
				FAST = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				Med = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				SLOW = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
			}
			Normal = {
				FAST = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				Med = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				SLOW = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
			}
			Bad = {
				FAST = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				Med = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
				SLOW = [
					GH3_Drummer_Lose_01
					GH3_Drummer_Lose_02
				]
			}
		}
		Transitions = {
		}
	}
}
crowd_animations = {
	IDLE = {
		GOOD = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_cheer1
				GH3_crowd_clapping1
			]
			Med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_cheer1
				GH3_crowd_clapping1
			]
			SLOW = [
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping2
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_jumping3
				GH3_crowd_cheer1
				GH3_crowd_clapping1
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_jumping1
				GH3_crowd_clapping1
			]
			Med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_jumping1
				GH3_crowd_clapping1
			]
			SLOW = [
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer1
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_cheer2
				GH3_crowd_jumping1
				GH3_crowd_clapping1
			]
		}
		Bad = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_cheer1
				GH3_crowd_jumping1
			]
			Med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_cheer1
				GH3_crowd_jumping1
			]
			SLOW = [
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping1
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_clapping2
				GH3_crowd_cheer1
				GH3_crowd_jumping1
			]
		}
	}
	Clapping = {
		GOOD = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			Med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			SLOW = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			Med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			SLOW = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
		Bad = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			Med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			SLOW = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
	}
	Jumping = {
		GOOD = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			Med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			SLOW = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			Med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			SLOW = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
		}
		Bad = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			Med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			SLOW = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
		}
	}
	Cheering = {
		GOOD = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			Med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			SLOW = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			Med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			SLOW = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
		Bad = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			Med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			SLOW = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
	}
}
drum_sets = {
	artdeco = drum_kit001
	wikker = drum_kit002
	budokan = drum_kit003
	DEFAULT = drum_kit001
}
drummer_anims = {
	track_36 = [
		Test_Drum_Kick
	]
	track_37 = [
		Test_Drum_HitTom3_L
	]
	track_38 = [
		Test_Drum_HitTom2_L
	]
	track_39 = [
		Test_Drum_HitTom1_L
	]
	track_40 = [
		Test_Drum_HitSnare_L
	]
	track_41 = [
		Test_Drum_HitHat_L
	]
	track_42 = [
		Test_Drum_HitHat_L
	]
	track_43 = [
		Test_Drum_HitCym3_L
	]
	track_44 = [
		Test_Drum_HitCym1_L
	]
	track_45 = [
		Test_Drum_HitCym2_L
	]
	track_48 = [
		Test_Drum_Kick
	]
	track_49 = [
		Test_Drum_HitTom3_R
	]
	track_50 = [
		Test_Drum_HitTom2_R
	]
	track_51 = [
		Test_Drum_HitTom1_R
	]
	track_52 = [
		Test_Drum_HitSnare_R
	]
	track_53 = [
		Test_Drum_HitHat_R
	]
	track_54 = [
		Test_Drum_HitHat_R
	]
	track_55 = [
		Test_Drum_HitCym3_R
	]
	track_56 = [
		Test_Drum_HitCym1_R
	]
	track_57 = [
		Test_Drum_HitCym2_R
	]
	sticktap_l = GH3_Drummer_HitSticks_L
	sticktap_r = GH3_Drummer_HitSticks_R
	stickdown_l = GH3_Drummer_SticksDownL
	stickdown_r = GH3_Drummer_SticksDownR
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
	Test_Drum_Cymbal_1
	Test_Drum_Cymbal_2
	Test_Drum_Cymbal_3
	Test_Drum_Cymbal_HH
]
player1_battlemode_anims = {
	Lightning = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	DifficultyUp = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	DoubleNotes = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	PowerUpSteal = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	LeftyNotes = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	BrokenString = {
		attack_anim = ATTACK
		response_anim = React_right
	}
	WhammyAttack = {
		attack_anim = ATTACK
		response_anim = React_right
	}
}
player2_battlemode_anims = {
	Lightning = {
		attack_anim = Attack_right
		response_anim = React
	}
	DifficultyUp = {
		attack_anim = Attack_right
		response_anim = React
	}
	DoubleNotes = {
		attack_anim = Attack_right
		response_anim = React
	}
	PowerUpSteal = {
		attack_anim = Attack_right
		response_anim = React
	}
	LeftyNotes = {
		attack_anim = Attack_right
		response_anim = React
	}
	BrokenString = {
		attack_anim = Attack_right
		response_anim = React
	}
	WhammyAttack = {
		attack_anim = Attack_right
		response_anim = React
	}
}
