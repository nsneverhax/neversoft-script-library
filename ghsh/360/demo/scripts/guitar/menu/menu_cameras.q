default_camera_transition_time = 0.3
default_camera_transition_params = {
	lockto = world
	screenoffset = (0.0, 0.0)
	motion = smooth
	fov = 72.0
}
ui_band_name_logo_career_camera = {
	params = {
		pos = (-0.7223039, 1.7968942, 5.0900965)
		quat = (0.088741995, -0.799859, 0.12220301)
	}
}
ui_band_name_logo_career_edit_camera = {
	params = {
		pos = (-0.895028, 1.7837701, 5.408024)
		quat = (0.079013005, -0.801791, 0.108806)
	}
}
ui_band_name_logo_edit_camera = {
	params = {
		pos = (-28.854452, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
}
ui_game_mode_no_time_camera = {
	params = {
		pos = (-29.75, -0.05, 5.2)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.0
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
}
ui_band_logo_choose_edit_camera = {
	params = {
		pos = (-30.006302, 0.150134, 5.2766047)
		quat = (-0.016580999, -0.99825096, 0.013075999)
	}
	time = 0.35000002
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
}
ui_bonus_videos_camera = {
	params = {
		pos = (2.7469783, 2.72618, -4.499031)
		quat = (0.002382, 0.83286697, -0.003583)
	}
	time = 0
}
ui_band_hub_camera = {
	params = {
		pos = (-1.936013, 1.264352, 16.570318)
		quat = (0.039439, 0.28752398, -0.011849)
	}
	time = 0
	dof = $dof_band_select_tod_manager
}
ui_character_hub_camera = $ui_band_hub_camera
ui_manage_band_camera = {
	params = {
		pos = (0.199322, 1.4477879, -1.3604008)
		quat = (0.059168, 0.25278798, -0.015489)
	}
	time = 0
}
ui_options_manage_band_logo_camera = {
	params = {
		pos = (-33.2, -0.0385, 20.7)
		quat = (0.0, 0.0, -0.0)
	}
	time = 0
}
ui_select_practice_mode_camera = $ui_band_hub_camera
ui_select_tutorial_camera = {
	params = {
		pos = (-0.056812998, 1.9871709, 6.484218)
		quat = (0.004413, 0.998728, -0.049861997)
	}
	time = 0
}
ui_practice_select_part_camera = $ui_select_practice_mode_camera
ui_practice_select_speed_camera = $ui_select_practice_mode_camera
ui_select_song_section_camera = $ui_select_practice_mode_camera
ui_special_events_camera = $ui_select_practice_mode_camera
ui_character_selection_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-0.35040402, 1.648048, 20.158203)
		quat = (0.083404, 0.552251, -0.055874996)
		fov = 72.0
	}
	time = 0
	transitiondof = $dof_car_selchar_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_singleplayer_character_hub_camera = $ui_character_selection_camera
ui_customize_character_body_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-2.7555532, 1.1219031, 19.937147)
		quat = (0.032732997, -0.168963, 0.005635)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_create_character_gender_camera = $ui_customize_character_body_camera
ui_create_character_genre_camera = $ui_customize_character_body_camera
ui_customize_character_camera = $ui_customize_character_body_camera
ui_customize_character_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-1.5688529, 1.490799, 23.65528)
		quat = (0.068767995, -0.746242, 0.077832)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-6.66915, 1.0431609, 20.399496)
		quat = (0.022544999, 0.470663, -0.012124)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-6.0568295, 1.548958, 25.210186)
		quat = (0.023461, 0.973523, -0.116777994)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_zoom_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-2.050385, 1.237919, 18.44562)
		quat = (0.034275997, -0.17028001, 0.005856)
	}
	time = 0
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_customize_character_head_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.1, 1.6, 1.3499999)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.3, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_character_face_deformation_camera = $ui_customize_character_head_camera
ui_character_face_deformation_options_camera = $ui_customize_character_head_camera
ui_customize_character_head_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.3, 1.6, 0.13)
		quat = (-0.0075000003, 0.75, -0.01)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.3, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.5, 1.6, 0.13)
		quat = (-0.0075000003, -0.75, 0.0)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.5, 0.55)
		distfromlookat = 1.3
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.1, 1.6, -1.4)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.4, 0.55)
		distfromlookat = 1.4
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_body_art_camera = $ui_customize_character_body_camera
ui_customize_tat_torso_camera = {
	params = {
		lockto = world
		pos = (-3.535871, 1.493876, 21.340794)
		quat = (0.022561999, -0.17275, 0.003955)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_l_camera = {
	params = {
		lockto = world
		pos = (-2.8971448, 1.4547619, 23.121782)
		quat = (0.016937999, -0.806392, 0.023117)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_r_camera = {
	params = {
		lockto = world
		pos = (-4.981299, 1.415312, 21.537992)
		quat = (0.034509, 0.47796798, -0.018801)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_b_camera = {
	params = {
		lockto = world
		pos = (-4.8746467, 1.41433, 23.218756)
		quat = (0.009672999, 0.968464, -0.038089)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_zoom_camera = $ui_customize_character_body_camera
ui_customize_tat_left_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.37594798, 1.269032, 2.111431)
		quat = (0.004667, 0.9949889, -0.078830004)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.308979, 0.408352)
		distfromlookat = 1.0916181
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.116613, 1.2301141, 1.2114341)
		quat = (0.035588, 0.831592, -0.056468)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.438685, 0.419828)
		distfromlookat = 1.123746
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.9319479, 1.285621, 1.3389809)
		quat = (0.060232997, -0.739464, 0.069754995)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.21271601, 0.43443203)
		distfromlookat = 1.030077
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.6775251, 1.28442, 0.38149202)
		quat = (0.08923301, -0.30482602, 0.030786)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.210738, 0.39500502)
		distfromlookat = 1.0554788
	}
	time = 1
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_right_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.536392, 1.183586, 2.1041079)
		quat = (0.020839, -0.95746005, 0.074631006)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.29516897, 0.401933)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.062104, 1.183565, 1.531828)
		quat = (0.041208997, 0.886725, -0.080965996)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.553213, 0.162007)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.1568221, 1.2131121, 0.9061769)
		quat = (0.083335996, -0.551375, 0.055142)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.18305601, 0.29856297)
		distfromlookat = 1.0
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.541795, 1.235371, 0.25687304)
		quat = (0.15555799, -0.119185, 0.008163)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.23425199, 0.064464994)
		distfromlookat = 1.086606
	}
	time = 1
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_character_stage_presence_camera = $ui_customize_character_body_camera
ui_customize_character_stage_presence_l_camera = $ui_customize_character_l_camera
ui_customize_character_stage_presence_r_camera = $ui_customize_character_r_camera
ui_customize_character_stage_presence_b_camera = $ui_customize_character_b_camera
ui_customize_presence_zoom_camera = $ui_customize_character_zoom_camera
ui_customize_character_outfit_camera = $ui_customize_character_body_camera
ui_customize_torso_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-3.5039692, 1.5710021, 21.199009)
		quat = (0.050977997, -0.165238, 0.00861)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-2.6413689, 1.673789, 22.741335)
		quat = (0.049406, -0.683538, 0.046710998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-5.1728864, 1.573969, 21.230242)
		quat = (0.053012997, 0.38474202, -0.022079)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-5.3046184, 1.6152371, 23.90506)
		quat = (0.015699, 0.97020495, -0.065171994)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_zoom_camera = $ui_customize_character_body_camera
ui_customize_pants_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-3.077889, 0.717537, 20.953318)
		quat = (0.025809001, -0.212557, 0.005302)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-2.33088, 1.3021669, 22.762165)
		quat = (0.138995, -0.65383106, 0.123823)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-5.1201563, 1.1991941, 20.770945)
		quat = (0.146358, 0.30269802, -0.047322)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-5.2490997, 1.9738301, 23.822226)
		quat = (0.06558199, 0.9212749, -0.33947903)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-3.138284, 0.37697402, 20.312454)
		quat = (0.049872994, -0.174991, 0.008995001)
		fov = 72.0
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-2.9516592, 0.431614, 22.113295)
		quat = (0.054306004, -0.7578651, 0.063751996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-4.7716947, 0.410181, 20.624996)
		quat = (0.023559, 0.415079, -0.010654)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (-4.8158526, 0.438844, 22.469734)
		quat = (0.022637, 0.95018697, -0.07076)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_character_outfit_accessories_camera = $ui_customize_character_outfit_camera
ui_customize_left_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.38981804, 1.448517, 1.514674)
		quat = (-0.036887996, -0.94504297, 0.012087)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.33, -0.43)
		distfromlookat = 0.7
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.61761004, 1.515005, 0.85277396)
		quat = (0.018893998, 0.76437294, -0.022418)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.46704, -0.296824)
		distfromlookat = 0.71705
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.746719, 1.4958689, 0.93558794)
		quat = (0.0067930003, -0.5966729, 0.005779)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.35052702, -0.24239202)
		distfromlookat = 0.61472505
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.307274, 1.5131941, 0.321828)
		quat = (0.037742, 0.41605902, -0.017283998)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.45049202, -0.35163602)
		distfromlookat = 0.73720294
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_camera = {
	params = {
		lockto = cas_player1
		pos = (0.085313, 1.4205688, 1.512116)
		quat = (0.02597, -0.99514097, 0.051035)
		fov = 72.0
		lookat = cas_player1
		lookatbone = bone_palm_r
		screenoffset = (0.569386, -0.24067101)
		distfromlookat = 0.641707
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.44154298, 1.568108, 1.320184)
		quat = (0.017483998, 0.90596896, -0.037806)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.449363, -0.30684003)
		distfromlookat = 0.736862
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.84123296, 1.5089421, 0.67411405)
		quat = (-0.009229999, -0.40879, -0.011880999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.289132, -0.179731)
		distfromlookat = 0.70690995
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.444352, 1.527882, 0.234818)
		quat = (0.0136049995, -0.008152, 0.0022480001)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.36062202, -0.226079)
		distfromlookat = 0.828549
	}
	time = 0.8
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_character_hair_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.1, 1.6, 1.3499999)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.35000002, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.3, 1.6, 0.13)
		quat = (-0.0075000003, 0.75, -0.01)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.3, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.5, 1.6, 0.13)
		quat = (-0.0075000003, -0.75, 0.0)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.5, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.1, 1.6, -1.4)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.4, 0.25)
		distfromlookat = 1.9
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_face_camera = $ui_customize_character_hair_camera
ui_customize_hat_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.1, 1.6, 1.3499999)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.35000002, 0.45000002)
		distfromlookat = 2.0
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_piercings_camera = $ui_customize_character_head_camera
ui_customize_character_instrument_camera = {
	params = {
		lockto = world
		pos = (-0.058148, 1.328394, 17.761456)
		quat = (0.031685, -0.318809, 0.010655)
		fov = 72.0
	}
	time = 0.5
	transitiondof = $dof_car_sel_instr_tod_manager
	dof = $dof_car_sel_instr_tod_manager
}
ui_cag_main_camera = {
	params = {
		lockto = world
		pos = (-2.849722, 1.3105879, 20.32342)
		quat = (-0.0155919995, -0.84931505, -0.025123)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_l_camera = {
	params = {
		lockto = world
		pos = (-5.237543, 1.4011251, 20.808203)
		quat = (-0.0010850001, 0.9919339, 0.008521001)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_r_camera = {
	params = {
		lockto = world
		pos = (-2.793702, 1.4162589, 18.192286)
		quat = (-0.007807, -0.417214, -0.003583)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_b_camera = {
	params = {
		lockto = world
		pos = (-5.959658, 1.407364, 17.719738)
		quat = (-0.00744, 0.49954, 0.0042920006)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_customize_cag_zoom_camera = $ui_cag_custom_body_camera
ui_cag_custom_camera = $ui_cag_main_camera
ui_cag_custom_body_camera = {
	params = {
		lockto = world
		pos = (-3.7233841, 1.048318, 19.782938)
		quat = (-0.015261, -0.8929389, -0.030352)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_l_camera = {
	params = {
		lockto = world
		pos = (-4.85122, 1.0527549, 20.083784)
		quat = (-0.0058669997, 0.99188197, 0.04982)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_r_camera = {
	params = {
		lockto = world
		pos = (-3.510334, 1.0445449, 18.471651)
		quat = (-0.031237999, -0.39297402, -0.013355999)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_b_camera = {
	params = {
		lockto = world
		pos = (-5.2713447, 1.1511921, 18.397333)
		quat = (0.0031430002, 0.538888, -0.0020090002)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_zoom_camera = $ui_cag_main_camera
ui_cag_custom_head_camera = {
	params = {
		lockto = world
		pos = (-3.967451, 2.0337791, 19.5615)
		quat = (0.02286, -0.904616, 0.048915)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_l_camera = {
	params = {
		lockto = world
		pos = (-4.696267, 1.8707659, 19.785374)
		quat = (-0.006128, 0.9925339, 0.056324005)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_r_camera = {
	params = {
		lockto = world
		pos = (-3.79443, 1.8498728, 18.732365)
		quat = (-0.074536, -0.444367, -0.037133)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_b_camera = {
	params = {
		lockto = world
		pos = (-4.906968, 1.866375, 18.386835)
		quat = (-0.051806998, 0.404114, 0.022933)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_zoom_camera = $ui_cag_main_camera
ui_cag_custom_basshead_camera = {
	params = {
		lockto = world
		pos = (8.282441, 1.961865, 25.097466)
		quat = (-0.027128998, 0.83970696, 0.042128)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_camera = {
	params = {
		lockto = world
		pos = (-3.5513368, 1.517792, 19.88847)
		quat = (-0.006356, -0.877675, -0.011641)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_l_camera = {
	params = {
		lockto = world
		pos = (-4.3456073, 1.59419, 20.244736)
		quat = (0.0019479999, -0.99285996, 0.016379999)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_r_camera = {
	params = {
		lockto = world
		pos = (-3.232347, 1.7212361, 19.094881)
		quat = (0.059096, -0.63559204, 0.048897)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_b_camera = {
	params = {
		lockto = world
		pos = (-5.170735, 1.6739452, 18.248238)
		quat = (0.044097997, 0.448211, -0.022143)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_zoom_camera = $ui_cag_main_camera
ui_cag_custom_hardware_camera = $ui_cag_custom_body_camera
ui_cag_custom_hardware_l_camera = $ui_cag_custom_body_l_camera
ui_cag_custom_hardware_r_camera = $ui_cag_custom_body_r_camera
ui_cag_custom_hardware_b_camera = $ui_cag_custom_body_b_camera
ui_cag_custom_hardware_zoom_camera = $ui_cag_main_camera
ui_cag_custom_strings_camera = {
	params = {
		pos = (-2.8479068, 1.231088, 20.104832)
		quat = (-0.0155919995, -0.84931505, -0.025123)
	}
	time = 0.3
}
ui_cadrm_main_camera = {
	params = {
		pos = (-0.867213, 1.638783, 18.972845)
		quat = (0.021101, 0.97537994, -0.107541)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_l_camera = {
	params = {
		lockto = world
		pos = (-1.6599929, 1.191496, 17.942184)
		quat = (0.047691997, 0.928441, -0.12820001)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_r_camera = {
	params = {
		lockto = world
		pos = (1.1692519, 0.828419, 19.530218)
		quat = (0.0057200002, -0.9925339, 0.051410995)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_skin_camera = {
	params = {
		lockto = world
		pos = (-0.300763, 0.444098, 17.590965)
		quat = (0.011954, 0.960014, -0.041486)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_l_camera = {
	params = {
		pos = (-0.67084503, 1.101066, 16.407099)
		quat = (0.10823901, 0.7919799, -0.14714299)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_r_camera = {
	params = {
		pos = (1.086523, 0.93802994, 18.038164)
		quat = (0.020188, -0.97823596, 0.17136301)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_back_camera = $ui_cad_select_skin_camera
ui_cadrm_hub_camera = $ui_cadrm_main_camera
ui_cad_select_size_camera = {
	params = {
		lockto = world
		pos = (0.058922004, 1.6912842, 18.831388)
		quat = (0.015315, 0.98109996, -0.17197601)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_camera = {
	params = {
		lockto = world
		pos = (-0.707261, 1.46684, 18.47329)
		quat = (0.028804999, 0.969764, -0.14251399)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_l_camera = {
	params = {
		lockto = world
		pos = (-1.583462, 1.28487, 16.582567)
		quat = (0.09120401, 0.837798, -0.147605)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_r_camera = {
	params = {
		lockto = world
		pos = (1.1692519, 0.828419, 19.530218)
		quat = (0.0057200002, -0.9925339, 0.051410995)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_drumsticks_camera = {
	params = {
		lockto = world
		pos = (0.79065895, 1.235389, 17.000298)
		quat = (0.005676, 0.979311, -0.027733998)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_l_camera = {
	params = {
		lockto = world
		pos = (0.38581505, 1.8474058, 15.503713)
		quat = (0.206401, 0.60482705, -0.166236)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_r_camera = {
	params = {
		lockto = world
		pos = (2.2288198, 1.4107159, 16.864979)
		quat = (0.055555, -0.878487, 0.10549301)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cadrm_zoom_camera = {
	params = {
		pos = (-0.5369449, 0.9129069, 18.116112)
		quat = (0.012069001, 0.968541, -0.047925)
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_customize_character_mic_camera = {
	params = {
		lockto = world
		pos = (-1.0499799, 1.405957, 18.633085)
		quat = (0.029420998, -0.943386, 0.087093)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_main_camera = $ui_customize_character_mic_camera
ui_customize_character_mic_l_camera = {
	params = {
		lockto = world
		pos = (-3.869716, 1.8813621, 18.11779)
		quat = (0.037262, 0.96264493, -0.182629)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_r_camera = {
	params = {
		lockto = world
		pos = (0.46963304, 1.5128509, 15.257174)
		quat = (0.080955, -0.559571, 0.055046)
		fov = 80.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_b_camera = {
	params = {
		lockto = world
		pos = (-0.973261, 1.40128, 18.542984)
		quat = (0.029420998, -0.943386, 0.087093)
		fov = 90.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_mic_zoom_camera = {
	params = {
		lockto = world
		pos = (-1.3963131, 1.4455699, 18.161255)
		quat = (0.03719, -0.954775, 0.13551998)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_micstand_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_microphone_camera = {
	params = {
		lockto = world
		pos = (-1.7762312, 1.341128, 16.995314)
		quat = (-0.0010070001, -0.93476, -0.0026460001)
		fov = 72.0
	}
	time = 0.0
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_f_camera = {
	params = {
		lockto = world
		pos = (-1.7339311, 1.351335, 16.956495)
		quat = (-0.01556, -0.90113693, -0.032452997)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_l_camera = {
	params = {
		lockto = world
		pos = (-2.308272, 1.346828, 16.982224)
		quat = (-0.0018750001, 0.99437994, 0.017874999)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_r_camera = {
	params = {
		lockto = world
		pos = (-1.39678, 1.3394988, 16.18203)
		quat = (-0.008689, -0.483174, -0.0047950004)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_b_camera = {
	params = {
		lockto = world
		pos = (-2.1361258, 1.2083281, 15.826272)
		quat = (-0.12660299, 0.16564998, 0.021449)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_mocap_01_camera = {
	params = {
		lockto = frontend_mocap_lock_target_01
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_mocap_02_camera = {
	params = {
		lockto = frontend_mocap_lock_target_02
		locktobone = bone_camera
		pos = (0.0, 0.0, 0.0)
		quat = (0.0, 0.0, 0.0)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
