slow_tempo = 75.0
med_tempo = 115.0
fast_tempo = 145.0
short_strum_max_gem_length = 150
med_strum_max_gem_length = 600
strum_anim_lead_time = 250
bass_strum_note = 24
always_strum = FALSE
tempo_matching_min_time_factor = 0.3
tempo_matching_max_time_factor = 2.5
finger_press_blend_time = 0.07
finger_release_blend_time = 0.2
finger_note_padding = 0.01
fret_blend_time = 0.1
min_walk_dist = 0.75
max_walk_camera_cut_delay = 1000
use_tempo_matching = true
normal_walk_data = {
	start_anim = {
		slow = GH3_Guitarist_Judy_A_Med_Wlk_Start
		med = GH3_Guitarist_Judy_A_Med_Wlk_Start
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_Start
	}
	cycle_anim = {
		slow = GH3_Guitarist_Judy_A_Med_Wlk_Loop
		med = GH3_Guitarist_Judy_A_Med_Wlk_Loop
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_Loop
	}
	stop_left_anim = {
		slow = GH3_Guitarist_Judy_A_Med_Wlk_EndL
		med = GH3_Guitarist_Judy_A_Med_Wlk_EndL
		FAST = GH3_Guitarist_Judy_A_Med_Wlk_EndL
	}
	stop_right_anim = {
		slow = GH3_Guitarist_Judy_A_Med_Wlk_EndR
		med = GH3_Guitarist_Judy_A_Med_Wlk_EndR
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
	short = [
		GH3_Hnd_Guit_Strum_Norm_S01_D
		GH3_Hnd_Guit_Strum_Norm_S02_D
		GH3_Hnd_Guit_Strum_Norm_S03_D
		GH3_Hnd_Guit_Strum_Norm_S04_D
		GH3_Hnd_Guit_Strum_Norm_S05_D
	]
	med = [
		GH3_Hnd_Guit_Strum_Norm_M01_D
		GH3_Hnd_Guit_Strum_Norm_M02_D
		GH3_Hnd_Guit_Strum_Norm_M03_D
	]
	long = [
		GH3_Hnd_Guit_Strum_Norm_L01_D
		GH3_Hnd_Guit_Strum_Norm_L02_D
	]
}
Mute_Strums = {
	no_strum_anim = GH3_Hnd_Guit_Strum_NoStrum_01_D
	short = [
		GH3_Hnd_Guit_Strum_Mute_S01_D
		GH3_Hnd_Guit_Strum_Mute_S02_D
		GH3_Hnd_Guit_Strum_Mute_S03_D
		GH3_Hnd_Guit_Strum_Mute_S04_D
		GH3_Hnd_Guit_Strum_Mute_S05_D
	]
	med = [
		GH3_Hnd_Guit_Strum_Mute_M01_D
		GH3_Hnd_Guit_Strum_Mute_M02_D
		GH3_Hnd_Guit_Strum_Mute_M03_D
	]
	long = [
		GH3_Hnd_Guit_Strum_Mute_L01_D
	]
}
bad_strums = {
	no_strum_anim = GH3_Hnd_Guit_Strum_NoStrum_01_D
	short = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
	med = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
	long = [
		GH3_Hnd_Guit_Strum_NoStrum_01_D
	]
}
Bass_Normal_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
	short = [
		gh3_hnd_bass_strum_strum_01_d
		gh3_hnd_bass_strum_strum_02_d
		gh3_hnd_bass_strum_strum_03_d
	]
	med = [
		GH3_Hnd_Guit_Strum_strum_01_D
		GH3_Hnd_Guit_Strum_strum_02_D
		GH3_Hnd_Guit_Strum_strum_03_D
	]
	long = [
		GH3_Hnd_Guit_Strum_strum_01_D
		GH3_Hnd_Guit_Strum_strum_02_D
		GH3_Hnd_Guit_Strum_strum_03_D
	]
}
Bass_Pick_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
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
Bass_Slap_Strums = {
	no_strum_anim = gh3_hnd_bass_strum_nostrum_01_D
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
	green = GH3_Hnd_Guit_Chord_SML_G_D
	red = GH3_Hnd_Guit_Chord_SML_C_D
	yellow = GH3_Hnd_Guit_Chord_SML_A_D
	blue = GH3_Hnd_Guit_Chord_SML_G_D
	orange = GH3_Hnd_Guit_Chord_SML_DSUS_D
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
	None = Gh3_hnd_guit_chord_SML_Empty_D
	track_none = Gh3_hnd_guit_chord_SML_Empty_D
}
guitarist_finger_anims_medium = {
	green = GH3_Hnd_Guit_Chord_LRG_G_D
	red = GH3_Hnd_Guit_Chord_LRG_C_D
	yellow = GH3_Hnd_Guit_Chord_LRG_A_D
	blue = GH3_Hnd_Guit_Chord_LRG_G_D
	orange = GH3_Hnd_Guit_Chord_LRG_DSUS_D
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
	None = Gh3_hnd_guit_chord_LRG_Empty_D
	track_none = Gh3_hnd_guit_chord_LRG_Empty_D
}
guitarist_finger_anims_large = {
	green = GH3_Hnd_Guit_Chord_LRG_Roll3_1_D
	red = GH3_Hnd_Guit_Chord_LRG_Roll3_2_D
	yellow = GH3_Hnd_Guit_Chord_LRG_Roll3_3_D
	blue = GH3_Hnd_Guit_Chord_LRG_Roll3_4_D
	orange = GH3_Hnd_Guit_Chord_LRG_Roll3_4_D
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
	None = Gh3_hnd_guit_chord_LRG_Empty_D
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
	track_93 = GH3_Hnd_Guit_Fret_Med_01_D
	track_92 = GH3_Hnd_Guit_Fret_Med_03_D
	track_91 = GH3_Hnd_Guit_Fret_Med_05_D
	track_90 = GH3_Hnd_Guit_Fret_Med_07_D
	track_89 = GH3_Hnd_Guit_Fret_Med_09_D
	track_88 = GH3_Hnd_Guit_Fret_Med_11_D
	track_87 = GH3_Hnd_Guit_Fret_Med_13_D
	track_86 = GH3_Hnd_Guit_Fret_Med_15_D
	track_85 = GH3_Hnd_Guit_Fret_Med_17_D
	track_84 = GH3_Hnd_Guit_Fret_Med_18_D
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
	track_93 = GH3_Hnd_Guit_Fret_Sml_01_D
	track_92 = GH3_Hnd_Guit_Fret_Sml_03_D
	track_91 = GH3_Hnd_Guit_Fret_Sml_05_D
	track_90 = GH3_Hnd_Guit_Fret_Sml_07_D
	track_89 = GH3_Hnd_Guit_Fret_Sml_09_D
	track_88 = GH3_Hnd_Guit_Fret_Sml_11_D
	track_87 = GH3_Hnd_Guit_Fret_Sml_13_D
	track_86 = GH3_Hnd_Guit_Fret_Sml_15_D
	track_85 = GH3_Hnd_Guit_Fret_Sml_17_D
	track_84 = GH3_Hnd_Guit_Fret_Sml_18_D
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
	track_93 = GH3_Hnd_Guit_Fret_Med_01_D
	track_92 = GH3_Hnd_Guit_Fret_Med_03_D
	track_91 = GH3_Hnd_Guit_Fret_Med_05_D
	track_90 = GH3_Hnd_Guit_Fret_Med_07_D
	track_89 = GH3_Hnd_Guit_Fret_Med_09_D
	track_88 = GH3_Hnd_Guit_Fret_Med_11_D
	track_87 = GH3_Hnd_Guit_Fret_Med_13_D
	track_86 = GH3_Hnd_Guit_Fret_Med_15_D
	track_85 = GH3_Hnd_Guit_Fret_Med_17_D
	track_84 = GH3_Hnd_Guit_Fret_Med_18_D
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
	track_93 = GH3_Hnd_Guit_Fret_Lrg_01_D
	track_92 = GH3_Hnd_Guit_Fret_Lrg_03_D
	track_91 = GH3_Hnd_Guit_Fret_Lrg_05_D
	track_90 = GH3_Hnd_Guit_Fret_Lrg_07_D
	track_89 = GH3_Hnd_Guit_Fret_Lrg_09_D
	track_88 = GH3_Hnd_Guit_Fret_Lrg_11_D
	track_87 = GH3_Hnd_Guit_Fret_Lrg_13_D
	track_86 = GH3_Hnd_Guit_Fret_Lrg_15_D
	track_85 = GH3_Hnd_Guit_Fret_Lrg_17_D
	track_84 = GH3_Hnd_Guit_Fret_Lrg_18_D
}
crowd_animations = {
	Idle = {
		good = {
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
			med = [
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
			slow = [
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
			med = [
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
			slow = [
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
		bad = {
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
			med = [
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
			slow = [
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
		good = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			slow = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			slow = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
		bad = {
			FAST = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			med = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
			slow = [
				GH3_crowd_clapping1
				GH3_crowd_clapping2
			]
		}
	}
	Jumping = {
		good = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			slow = [
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
			med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			slow = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
		}
		bad = {
			FAST = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			med = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
			slow = [
				GH3_crowd_jumping1
				GH3_crowd_jumping2
				GH3_crowd_jumping3
			]
		}
	}
	Cheering = {
		good = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			slow = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
		Normal = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			slow = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
		bad = {
			FAST = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			med = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
			slow = [
				GH3_crowd_cheer1
				GH3_crowd_cheer2
			]
		}
	}
}
player1_battlemode_anims = {
	Lightning = {
		attack_anim = Attack
		response_anim = React_right
	}
	DifficultyUp = {
		attack_anim = Attack
		response_anim = React_right
	}
	DoubleNotes = {
		attack_anim = Attack
		response_anim = React_right
	}
	PowerUpSteal = {
		attack_anim = Attack
		response_anim = React_right
	}
	LeftyNotes = {
		attack_anim = Attack
		response_anim = React_right
	}
	BrokenString = {
		attack_anim = Attack
		response_anim = React_right
	}
	WhammyAttack = {
		attack_anim = Attack
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
