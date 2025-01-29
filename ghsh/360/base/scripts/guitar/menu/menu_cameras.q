default_camera_transition_time = 0.3
default_camera_transition_params = {
	LockTo = World
	ScreenOffset = (0.0, 0.0)
	motion = smooth
	FOV = 72.0
}
ui_band_name_logo_career_camera = {
	params = {
		Pos = (-0.7223039, 1.7968942, 5.0900965)
		Quat = (0.088741995, -0.799859, 0.12220301)
	}
}
ui_band_name_logo_career_edit_camera = {
	params = {
		Pos = (-0.895028, 1.7837701, 5.408024)
		Quat = (0.079013005, -0.801791, 0.108806)
	}
}
ui_band_name_logo_edit_camera = {
	params = {
		Pos = (-28.854452, 0.47631302, 7.1957684)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
}
ui_game_mode_no_time_camera = {
	params = {
		Pos = (-29.75, -0.05, 5.2)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.0
	transitiondof = $DOF_CloseUp02_TOD_Manager
	DOF = $dof_uiblur_tod_manager
}
ui_band_logo_choose_edit_camera = {
	params = {
		Pos = (-30.006302, 0.150134, 5.2766047)
		Quat = (-0.016580999, -0.99825096, 0.013075999)
	}
	time = 0.35000002
	transitiondof = $DOF_CloseUp02_TOD_Manager
	DOF = $dof_uiblur_tod_manager
}
ui_bonus_videos_camera = {
	params = {
		Pos = (2.7469783, 2.72618, -4.499031)
		Quat = (0.002382, 0.83286697, -0.003583)
	}
	time = 0
}
ui_band_hub_camera = {
	params = {
		Pos = (-1.936013, 1.264352, 16.570318)
		Quat = (0.039439, 0.28752398, -0.011849)
	}
	time = 0
	DOF = $dof_band_select_tod_manager
}
ui_character_hub_camera = $ui_band_hub_camera
ui_manage_band_camera = {
	params = {
		Pos = (0.199322, 1.4477879, -1.3604008)
		Quat = (0.059168, 0.25278798, -0.015489)
	}
	time = 0
}
ui_options_manage_band_logo_camera = {
	params = {
		Pos = (-33.2, -0.0385, 20.7)
		Quat = (0.0, 0.0, -0.0)
	}
	time = 0
}
ui_select_practice_mode_camera = $ui_band_hub_camera
ui_select_tutorial_camera = {
	params = {
		Pos = (-0.056812998, 1.9871709, 6.484218)
		Quat = (0.004413, 0.998728, -0.049861997)
	}
	time = 0
}
ui_practice_select_part_camera = $ui_select_practice_mode_camera
ui_practice_select_speed_camera = $ui_select_practice_mode_camera
ui_select_song_section_camera = $ui_select_practice_mode_camera
ui_special_events_camera = $ui_select_practice_mode_camera
ui_character_selection_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-0.35040402, 1.648048, 20.158203)
		Quat = (0.083404, 0.552251, -0.055874996)
		FOV = 72.0
	}
	time = 0
	transitiondof = $dof_car_selchar_tod_manager
	DOF = $dof_car_selchar_tod_manager
}
ui_singleplayer_character_hub_camera = $ui_character_selection_camera
ui_customize_character_body_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-2.7555532, 1.1219031, 19.937147)
		Quat = (0.032732997, -0.168963, 0.005635)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	DOF = $dof_car_selchar_tod_manager
}
ui_create_character_gender_camera = $ui_customize_character_body_camera
ui_create_character_genre_camera = $ui_customize_character_body_camera
ui_customize_character_camera = $ui_customize_character_body_camera
ui_customize_character_l_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-1.5688529, 1.490799, 23.65528)
		Quat = (0.068767995, -0.746242, 0.077832)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	DOF = $dof_car_selgender_tod_manager
}
ui_customize_character_r_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-6.66915, 1.0431609, 20.399496)
		Quat = (0.022544999, 0.470663, -0.012124)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	DOF = $dof_car_selgender_tod_manager
}
ui_customize_character_b_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-6.0568295, 1.548958, 25.210186)
		Quat = (0.023461, 0.973523, -0.116777994)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	DOF = $dof_car_selgender_tod_manager
}
ui_customize_character_zoom_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		Pos = (-2.050385, 1.237919, 18.44562)
		Quat = (0.034275997, -0.17028001, 0.005856)
	}
	time = 0
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_customize_character_head_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.1, 1.6, 1.3499999)
		Quat = (0.0, -1.0, -0.01)
		FOV = 35
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.3, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_character_face_deformation_camera = $ui_customize_character_head_camera
ui_character_face_deformation_options_camera = $ui_customize_character_head_camera
ui_customize_character_head_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-1.3, 1.6, 0.13)
		Quat = (-0.0075000003, 0.75, -0.01)
		FOV = 35.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.3, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (1.5, 1.6, 0.13)
		Quat = (-0.0075000003, -0.75, 0.0)
		FOV = 35.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.5, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_b_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.1, 1.6, -1.4)
		Quat = (0.0, -1.0, -0.01)
		FOV = 35
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.4, 0.55)
		distfromlookat = 1.4
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_body_art_camera = $ui_customize_character_body_camera
ui_customize_tat_torso_camera = {
	params = {
		LockTo = World
		Pos = (-3.535871, 1.493876, 21.340794)
		Quat = (0.022561999, -0.17275, 0.003955)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_l_camera = {
	params = {
		LockTo = World
		Pos = (-2.8971448, 1.4547619, 23.121782)
		Quat = (0.016937999, -0.806392, 0.023117)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_r_camera = {
	params = {
		LockTo = World
		Pos = (-4.981299, 1.415312, 21.537992)
		Quat = (0.034509, 0.47796798, -0.018801)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_b_camera = {
	params = {
		LockTo = World
		Pos = (-4.8746467, 1.41433, 23.218756)
		Quat = (0.009672999, 0.968464, -0.038089)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_zoom_camera = $ui_customize_character_body_camera
ui_customize_tat_left_arm_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.37594798, 1.269032, 2.111431)
		Quat = (0.004667, 0.9949889, -0.078830004)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.308979, 0.408352)
		distfromlookat = 1.0916181
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	DOF = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-1.116613, 1.2301141, 1.2114341)
		Quat = (0.035588, 0.831592, -0.056468)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.438685, 0.419828)
		distfromlookat = 1.123746
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	DOF = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.9319479, 1.285621, 1.3389809)
		Quat = (0.060232997, -0.739464, 0.069754995)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.21271601, 0.43443203)
		distfromlookat = 1.030077
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	DOF = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_b_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.6775251, 1.28442, 0.38149202)
		Quat = (0.08923301, -0.30482602, 0.030786)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.210738, 0.39500502)
		distfromlookat = 1.0554788
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	DOF = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_right_arm_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.536392, 1.183586, 2.1041079)
		Quat = (0.020839, -0.95746005, 0.074631006)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.29516897, 0.401933)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	DOF = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-1.062104, 1.183565, 1.531828)
		Quat = (0.041208997, 0.886725, -0.080965996)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.553213, 0.162007)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	DOF = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (1.1568221, 1.2131121, 0.9061769)
		Quat = (0.083335996, -0.551375, 0.055142)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.18305601, 0.29856297)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	DOF = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_b_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.541795, 1.235371, 0.25687304)
		Quat = (0.15555799, -0.119185, 0.008163)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.23425199, 0.064464994)
		distfromlookat = 1.086606
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	DOF = $dof_car_sel_tat_r_tod_manager
}
ui_customize_character_stage_presence_camera = $ui_customize_character_body_camera
ui_customize_character_stage_presence_l_camera = $ui_customize_character_l_camera
ui_customize_character_stage_presence_r_camera = $ui_customize_character_r_camera
ui_customize_character_stage_presence_b_camera = $ui_customize_character_b_camera
ui_customize_presence_zoom_camera = $ui_customize_character_zoom_camera
ui_customize_character_outfit_camera = $ui_customize_character_body_camera
ui_customize_torso_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-3.5039692, 1.5710021, 21.199009)
		Quat = (0.050977997, -0.165238, 0.00861)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_l_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-2.6413689, 1.673789, 22.741335)
		Quat = (0.049406, -0.683538, 0.046710998)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_r_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-5.1728864, 1.573969, 21.230242)
		Quat = (0.053012997, 0.38474202, -0.022079)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_b_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-5.3046184, 1.6152371, 23.90506)
		Quat = (0.015699, 0.97020495, -0.065171994)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_zoom_camera = $ui_customize_character_body_camera
ui_customize_pants_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-3.077889, 0.717537, 20.953318)
		Quat = (0.025809001, -0.212557, 0.005302)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_l_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-2.33088, 1.3021669, 22.762165)
		Quat = (0.138995, -0.65383106, 0.123823)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_r_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-5.1201563, 1.1991941, 20.770945)
		Quat = (0.146358, 0.30269802, -0.047322)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_b_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-5.2490997, 1.9738301, 23.822226)
		Quat = (0.06558199, 0.9212749, -0.33947903)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-3.138284, 0.37697402, 20.312454)
		Quat = (0.049872994, -0.174991, 0.008995001)
		FOV = 72.0
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_l_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-2.9516592, 0.431614, 22.113295)
		Quat = (0.054306004, -0.7578651, 0.063751996)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_r_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-4.7716947, 0.410181, 20.624996)
		Quat = (0.023559, 0.415079, -0.010654)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_b_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = World
		Pos = (-4.8158526, 0.438844, 22.469734)
		Quat = (0.022637, 0.95018697, -0.07076)
		FOV = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	DOF = $dof_car_selecttorso_tod_manager
}
ui_customize_character_outfit_accessories_camera = $ui_customize_character_outfit_camera
ui_customize_left_arm_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.38981804, 1.448517, 1.514674)
		Quat = (-0.036887996, -0.94504297, 0.012087)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.33, -0.43)
		distfromlookat = 0.7
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_left_arm_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.61761004, 1.515005, 0.85277396)
		Quat = (0.018893998, 0.76437294, -0.022418)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.46704, -0.296824)
		distfromlookat = 0.71705
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_left_arm_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.746719, 1.4958689, 0.93558794)
		Quat = (0.0067930003, -0.5966729, 0.005779)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.35052702, -0.24239202)
		distfromlookat = 0.61472505
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_left_arm_b_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.307274, 1.5131941, 0.321828)
		Quat = (0.037742, 0.41605902, -0.017283998)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_L
		ScreenOffset = (0.45049202, -0.35163602)
		distfromlookat = 0.73720294
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_right_arm_camera = {
	params = {
		LockTo = cas_player1
		Pos = (0.085313, 1.4205688, 1.512116)
		Quat = (0.02597, -0.99514097, 0.051035)
		FOV = 72.0
		LookAt = cas_player1
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.569386, -0.24067101)
		distfromlookat = 0.641707
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_right_arm_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.44154298, 1.568108, 1.320184)
		Quat = (0.017483998, 0.90596896, -0.037806)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.449363, -0.30684003)
		distfromlookat = 0.736862
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_right_arm_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.84123296, 1.5089421, 0.67411405)
		Quat = (-0.009229999, -0.40879, -0.011880999)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.289132, -0.179731)
		distfromlookat = 0.70690995
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_right_arm_b_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.444352, 1.527882, 0.234818)
		Quat = (0.0136049995, -0.008152, 0.0022480001)
		FOV = 72.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Palm_R
		ScreenOffset = (0.36062202, -0.226079)
		distfromlookat = 0.828549
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_customize_character_hair_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.1, 1.6, 1.3499999)
		Quat = (0.0, -1.0, -0.01)
		FOV = 35
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.35000002, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_l_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-1.3, 1.6, 0.13)
		Quat = (-0.0075000003, 0.75, -0.01)
		FOV = 35.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.3, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_r_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (1.5, 1.6, 0.13)
		Quat = (-0.0075000003, -0.75, 0.0)
		FOV = 35.0
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.5, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_b_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (-0.1, 1.6, -1.4)
		Quat = (0.0, -1.0, -0.01)
		FOV = 35
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.4, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_face_camera = $ui_customize_character_hair_camera
ui_customize_hat_camera = {
	params = {
		LockTo = $cas_current_player_name
		Pos = (0.1, 1.6, 1.3499999)
		Quat = (0.0, -1.0, -0.01)
		FOV = 35
		LookAt = $cas_current_player_name
		LookAtBone = Bone_Neck
		ScreenOffset = (0.35000002, 0.45000002)
		distfromlookat = 2.0
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	DOF = $dof_car_sel_glasses_tod_manager
}
ui_customize_piercings_camera = $ui_customize_character_head_camera
ui_customize_character_instrument_camera = {
	params = {
		LockTo = World
		Pos = (-0.058148, 1.328394, 17.761456)
		Quat = (0.031685, -0.318809, 0.010655)
		FOV = 72.0
	}
	time = 0.5
	transitiondof = $dof_car_sel_instr_tod_manager
	DOF = $dof_car_sel_instr_tod_manager
}
ui_cag_main_camera = {
	params = {
		LockTo = World
		Pos = (-2.849722, 1.3105879, 20.32342)
		Quat = (-0.0155919995, -0.84931505, -0.025123)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_l_camera = {
	params = {
		LockTo = World
		Pos = (-5.237543, 1.4011251, 20.808203)
		Quat = (-0.0010850001, 0.9919339, 0.008521001)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_r_camera = {
	params = {
		LockTo = World
		Pos = (-2.793702, 1.4162589, 18.192286)
		Quat = (-0.007807, -0.417214, -0.003583)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_b_camera = {
	params = {
		LockTo = World
		Pos = (-5.959658, 1.407364, 17.719738)
		Quat = (-0.00744, 0.49954, 0.0042920006)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_customize_cag_zoom_camera = $ui_cag_custom_body_camera
ui_cag_custom_camera = $ui_cag_main_camera
ui_cag_custom_body_camera = {
	params = {
		LockTo = World
		Pos = (-3.7233841, 1.048318, 19.782938)
		Quat = (-0.015261, -0.8929389, -0.030352)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_l_camera = {
	params = {
		LockTo = World
		Pos = (-4.85122, 1.0527549, 20.083784)
		Quat = (-0.0058669997, 0.99188197, 0.04982)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_r_camera = {
	params = {
		LockTo = World
		Pos = (-3.510334, 1.0445449, 18.471651)
		Quat = (-0.031237999, -0.39297402, -0.013355999)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_b_camera = {
	params = {
		LockTo = World
		Pos = (-5.2713447, 1.1511921, 18.397333)
		Quat = (0.0031430002, 0.538888, -0.0020090002)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_zoom_camera = $ui_cag_main_camera
ui_cag_custom_head_camera = {
	params = {
		LockTo = World
		Pos = (-3.967451, 2.0337791, 19.5615)
		Quat = (0.02286, -0.904616, 0.048915)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_l_camera = {
	params = {
		LockTo = World
		Pos = (-4.696267, 1.8707659, 19.785374)
		Quat = (-0.006128, 0.9925339, 0.056324005)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_r_camera = {
	params = {
		LockTo = World
		Pos = (-3.79443, 1.8498728, 18.732365)
		Quat = (-0.074536, -0.444367, -0.037133)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_b_camera = {
	params = {
		LockTo = World
		Pos = (-4.906968, 1.866375, 18.386835)
		Quat = (-0.051806998, 0.404114, 0.022933)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_zoom_camera = $ui_cag_main_camera
ui_cag_custom_basshead_camera = {
	params = {
		LockTo = World
		Pos = (8.282441, 1.961865, 25.097466)
		Quat = (-0.027128998, 0.83970696, 0.042128)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_camera = {
	params = {
		LockTo = World
		Pos = (-3.5513368, 1.517792, 19.88847)
		Quat = (-0.006356, -0.877675, -0.011641)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_l_camera = {
	params = {
		LockTo = World
		Pos = (-4.3456073, 1.59419, 20.244736)
		Quat = (0.0019479999, -0.99285996, 0.016379999)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_r_camera = {
	params = {
		LockTo = World
		Pos = (-3.232347, 1.7212361, 19.094881)
		Quat = (0.059096, -0.63559204, 0.048897)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_b_camera = {
	params = {
		LockTo = World
		Pos = (-5.170735, 1.6739452, 18.248238)
		Quat = (0.044097997, 0.448211, -0.022143)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	DOF = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_zoom_camera = $ui_cag_main_camera
ui_cag_custom_hardware_camera = $ui_cag_custom_body_camera
ui_cag_custom_hardware_l_camera = $ui_cag_custom_body_l_camera
ui_cag_custom_hardware_r_camera = $ui_cag_custom_body_r_camera
ui_cag_custom_hardware_b_camera = $ui_cag_custom_body_b_camera
ui_cag_custom_hardware_zoom_camera = $ui_cag_main_camera
ui_cag_custom_strings_camera = {
	params = {
		Pos = (-2.8479068, 1.231088, 20.104832)
		Quat = (-0.0155919995, -0.84931505, -0.025123)
	}
	time = 0.3
}
ui_cadrm_main_camera = {
	params = {
		Pos = (-0.867213, 1.638783, 18.972845)
		Quat = (0.021101, 0.97537994, -0.107541)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_l_camera = {
	params = {
		LockTo = World
		Pos = (-1.6599929, 1.191496, 17.942184)
		Quat = (0.047691997, 0.928441, -0.12820001)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_r_camera = {
	params = {
		LockTo = World
		Pos = (1.1692519, 0.828419, 19.530218)
		Quat = (0.0057200002, -0.9925339, 0.051410995)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cad_select_skin_camera = {
	params = {
		LockTo = World
		Pos = (-0.300763, 0.444098, 17.590965)
		Quat = (0.011954, 0.960014, -0.041486)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_l_camera = {
	params = {
		Pos = (-0.67084503, 1.101066, 16.407099)
		Quat = (0.10823901, 0.7919799, -0.14714299)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_r_camera = {
	params = {
		Pos = (1.086523, 0.93802994, 18.038164)
		Quat = (0.020188, -0.97823596, 0.17136301)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cadrm_back_camera = $ui_cad_select_skin_camera
ui_cadrm_hub_camera = $ui_cadrm_main_camera
ui_cad_select_size_camera = {
	params = {
		LockTo = World
		Pos = (0.058922004, 1.6912842, 18.831388)
		Quat = (0.015315, 0.98109996, -0.17197601)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_camera = {
	params = {
		LockTo = World
		Pos = (-0.707261, 1.46684, 18.47329)
		Quat = (0.028804999, 0.969764, -0.14251399)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_l_camera = {
	params = {
		LockTo = World
		Pos = (-1.583462, 1.28487, 16.582567)
		Quat = (0.09120401, 0.837798, -0.147605)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_r_camera = {
	params = {
		LockTo = World
		Pos = (1.1692519, 0.828419, 19.530218)
		Quat = (0.0057200002, -0.9925339, 0.051410995)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_cad_select_drumsticks_camera = {
	params = {
		LockTo = World
		Pos = (0.79065895, 1.235389, 17.000298)
		Quat = (0.005676, 0.979311, -0.027733998)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_l_camera = {
	params = {
		LockTo = World
		Pos = (0.38581505, 1.8474058, 15.503713)
		Quat = (0.206401, 0.60482705, -0.166236)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_r_camera = {
	params = {
		LockTo = World
		Pos = (2.2288198, 1.4107159, 16.864979)
		Quat = (0.055555, -0.878487, 0.10549301)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drumsticks_tod_manager
}
ui_cadrm_zoom_camera = {
	params = {
		Pos = (-0.5369449, 0.9129069, 18.116112)
		Quat = (0.012069001, 0.968541, -0.047925)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	DOF = $dof_car_sel_drums_tod_manager
}
ui_customize_character_mic_camera = {
	params = {
		LockTo = World
		Pos = (-1.0499799, 1.405957, 18.633085)
		Quat = (0.029420998, -0.943386, 0.087093)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	DOF = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_main_camera = $ui_customize_character_mic_camera
ui_customize_character_mic_l_camera = {
	params = {
		LockTo = World
		Pos = (-3.869716, 1.8813621, 18.11779)
		Quat = (0.037262, 0.96264493, -0.182629)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	DOF = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_r_camera = {
	params = {
		LockTo = World
		Pos = (0.46963304, 1.5128509, 15.257174)
		Quat = (0.080955, -0.559571, 0.055046)
		FOV = 80.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	DOF = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_b_camera = {
	params = {
		LockTo = World
		Pos = (-0.973261, 1.40128, 18.542984)
		Quat = (0.029420998, -0.943386, 0.087093)
		FOV = 90.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	DOF = $dof_car_sel_micstand_tod_manager
}
ui_customize_mic_zoom_camera = {
	params = {
		LockTo = World
		Pos = (-1.3963131, 1.4455699, 18.161255)
		Quat = (0.03719, -0.954775, 0.13551998)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	DOF = $dof_car_sel_micstand_tod_manager
}
ui_customize_microphone_camera = {
	params = {
		LockTo = World
		Pos = (-1.7762312, 1.341128, 16.995314)
		Quat = (-0.0010070001, -0.93476, -0.0026460001)
		FOV = 72.0
	}
	time = 0.0
	transitiondof = $dof_car_sel_microphone_tod_manager
	DOF = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_f_camera = {
	params = {
		LockTo = World
		Pos = (-1.7339311, 1.351335, 16.956495)
		Quat = (-0.01556, -0.90113693, -0.032452997)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	DOF = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_l_camera = {
	params = {
		LockTo = World
		Pos = (-2.308272, 1.346828, 16.982224)
		Quat = (-0.0018750001, 0.99437994, 0.017874999)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	DOF = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_r_camera = {
	params = {
		LockTo = World
		Pos = (-1.39678, 1.3394988, 16.18203)
		Quat = (-0.008689, -0.483174, -0.0047950004)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	DOF = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_b_camera = {
	params = {
		LockTo = World
		Pos = (-2.1361258, 1.2083281, 15.826272)
		Quat = (-0.12660299, 0.16564998, 0.021449)
		FOV = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	DOF = $dof_car_sel_microphone_tod_manager
}
ui_mocap_01_camera = {
	params = {
		LockTo = frontend_mocap_lock_target_01
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	DOF = $dof_car_accl_tod_manager
}
ui_mocap_02_camera = {
	params = {
		LockTo = frontend_mocap_lock_target_02
		LockToBone = bone_camera
		Pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	DOF = $dof_car_accl_tod_manager
}
