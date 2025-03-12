default_camera_transition_time = 0.3
default_camera_transition_params = {
	lockto = world
	screenoffset = (0.0, 0.0)
	motion = smooth
	fov = 72.0
}
ui_boot_iis_camera = {
	params = {
		pos = (-28.344543, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.0
}
ui_mainmenu_camera = {
	params = {
		lockto = world
		pos = (-12.2872505, 2.768528, 23.516026)
		quat = (0.0035930001, 0.917991, -0.031315)
		fov = 87.0
	}
}
ui_mainmenu_intro_camera = $ui_mainmenu_camera
ui_music_central_camera = $ui_mainmenu_camera
ui_whiteboard_options_camera = {
	params = {
		pos = (-29.75, -0.05, 5.2)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.35000002
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
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
ui_band_hub_camera = {
	params = {
		pos = (0.444145, 1.6750801, 5.6426005)
		quat = (0.09144401, -0.74900204, 0.105756)
	}
	time = 0
}
ui_manage_band_camera = {
	params = {
		pos = (0.646733, 1.5153971, -4.602089)
		quat = (0.000177, -0.9993379, 0.036047995)
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
ui_character_selection_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.054568, 1.2011342, 2.1818027)
		quat = (0.005235, -0.9903699, 0.040436998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selchar_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_body_camera = $ui_character_selection_camera
ui_create_character_gender_camera = $ui_character_selection_camera
ui_create_character_genre_camera = $ui_character_selection_camera
ui_customize_character_camera = $ui_character_selection_camera
ui_customize_character_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-3.11777, 1.1894519, -0.706811)
		quat = (0.023169, 0.77037996, -0.02791)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (2.782295, 1.3157389, -0.27423105)
		quat = (0.046230998, -0.68538, 0.043938998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.15907201, 1.473959, -2.323729)
		quat = (0.064395994, 0.118011996, -0.0075870003)
		fov = 95.0
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_zoom_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-0.221678, 1.197092, 2.1941507)
		quat = (0.005478, -0.99001294, 0.041061997)
		fov = 88.0
	}
	time = 0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
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
ui_character_face_deformation_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.1, 1.6, 1.3499999)
		quat = (0.0, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.3, 0.55)
	}
	time = 0.4
	transitiondof = $dof_car_sel_glasses_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_character_face_deformation_options_camera = $ui_character_face_deformation_camera
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
ui_customize_character_fingernails_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.207082, 1.466238, 0.32631603)
		quat = (-0.003738, 0.9957779, 0.03676)
		fov = 62.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.211144, 0.201143)
		distfromlookat = 0.62380207
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_character_fingernails_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.6319879, 1.468222, -0.09509101)
		quat = (-0.014367, 0.86710805, 0.025303)
		fov = 62.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.45643106, 0.162453)
		distfromlookat = 0.624206
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_character_fingernails_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.666184, 1.604223, -0.036907997)
		quat = (0.042587, -0.784709, 0.054068)
		fov = 62.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.14403999, 0.13213399)
		distfromlookat = 0.746732
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_character_fingernails_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.32454902, 1.6067451, -0.797321)
		quat = (0.068398, -0.14646901, 0.011375001)
		fov = 62.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.536466, 0.24229802)
		distfromlookat = 0.65613604
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_character_body_art_camera = $ui_character_selection_camera
ui_customize_tat_torso_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.09520801, 1.2958001, 0.34899598)
		quat = (0.0016810001, -0.9965829, 0.020938)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.31034598, -0.22604398)
		distfromlookat = 1
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.0290949, 1.2758402, -0.18246302)
		quat = (-0.013328, 0.874789, 0.01264)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.347365, -0.16107601)
		distfromlookat = 1.04236
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.729732, 1.3040708, -0.26947302)
		quat = (0.000267, -0.708058, -0.014265)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.42706102, -0.320066)
		distfromlookat = 0.833961
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.056472998, 1.3246828, -1.2654159)
		quat = (-0.033610996, 0.082738996, -0.0065409997)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.31975302, -0.15208201)
		distfromlookat = 0.73869294
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_zoom_camera = $ui_character_selection_camera
ui_customize_tat_left_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.40275502, 1.1954141, 0.85976905)
		quat = (-0.002459, 0.99357295, -0.014668)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.43534198, 0.423149)
		distfromlookat = 0.87844104
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.005965, 1.1912322, -0.264199)
		quat = (0.003881, 0.73938996, -0.010548)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.68991697, 0.341029)
		distfromlookat = 1.09579
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.92754203, 1.2081372, 0.35196)
		quat = (0.0017, -0.77003795, -0.00454)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.123284005, 0.505627)
		distfromlookat = 0.960395
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.27173302, 0.750801, -0.291643)
		quat = (-0.408818, -0.125098, -0.061276995)
		fov = 100
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.41189998, 0.758386)
		distfromlookat = 0.55270296
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_l_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_right_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.025942001, 1.1909001, 0.719419)
		quat = (0.028585998, -0.98904294, 0.050685)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.29930198, 0.23109901)
		distfromlookat = 0.807693
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.037548, 1.1054909, 0.12792)
		quat = (-0.038248997, 0.891157, 0.028744)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.6658121, 0.45063004)
		distfromlookat = 0.97161096
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.62336606, 1.223109, 0.230903)
		quat = (0.09561901, -0.80761606, -0.013132999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.072891, 0.417636)
		distfromlookat = 0.794316
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.063125, 0.62637895, -0.28417)
		quat = (-0.502096, -0.282722, -0.22953399)
		fov = 90.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (-0.004043, 0.412225)
		distfromlookat = 0.493591
	}
	time = 0.4
	transitiondof = $dof_car_sel_tat_r_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_character_outfit_camera = $ui_character_selection_camera
ui_customize_torso_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-0.16456199, 1.4271559, 1.1476759)
		quat = (0.00153, -0.99671495, 0.018818)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.33393902, -0.107880995)
		distfromlookat = 1.6927251
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-1.628691, 1.419264, 0.434108)
		quat = (0.012201999, 0.914002, -0.028982)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.25718796, -0.18109801)
		distfromlookat = 1.8057749
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (1.174536, 1.430895, 0.440885)
		quat = (0.0075910003, -0.8498661, 0.009891)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.34420902, -0.041578997)
		distfromlookat = 1.6019361
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-0.12897101, 1.72871, -2.237056)
		quat = (0.088258006, 0.109216005, -0.009091999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_chest
		screenoffset = (0.28374898, -0.014165999)
		distfromlookat = 1.7542499
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_zoom_camera = $ui_character_selection_camera
ui_customize_pants_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.23906802, 0.778655, 1.388686)
		quat = (-0.003396, -0.980715, 0.055402)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_pelvis
		screenoffset = (0.40047303, -0.62489)
		distfromlookat = 1.992236
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-1.881099, 0.62740403, -0.109586)
		quat = (0.009955, 0.834016, -0.014249999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_pelvis
		screenoffset = (0.21370801, -0.770952)
		distfromlookat = 2.003911
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (1.997216, 0.708394, -0.17817602)
		quat = (0.020073999, -0.68249696, 0.021016)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_pelvis
		screenoffset = (0.42543903, -0.69442105)
		distfromlookat = 2.0635881
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-0.78129095, 0.835722, -2.3607109)
		quat = (0.062855, 0.32623604, -0.016847)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_pelvis
		screenoffset = (0.36895102, -0.592581)
		distfromlookat = 1.96834
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.258281, 0.168591, 0.81133294)
		quat = (-0.018470999, -0.977264, -0.044747997)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_ankle_r
		screenoffset = (0.13657399, 0.38085705)
		distfromlookat = 0.89691794
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-1.0198749, 0.20799501, 0.241593)
		quat = (-0.0144299995, 0.868304, 0.02443)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_ankle_r
		screenoffset = (0.412249, 0.36631802)
		distfromlookat = 1.027205
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.899672, 0.155602, 0.16535899)
		quat = (-0.039141, -0.693732, -0.029451)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_ankle_r
		screenoffset = (0.395172, 0.32942304)
		distfromlookat = 0.955228
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (0.129893, 0.11354, -0.7332339)
		quat = (-0.057287, 0.041964997, 0.015682)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_ankle_r
		screenoffset = (0.48396102, 0.11318199)
		distfromlookat = 0.7485521
	}
	time = 0.4
	transitiondof = $dof_car_selecttorso_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_zoom_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = $cas_current_player_name
		pos = (-0.21857601, 0.994221, 2.210477)
		quat = (0.0053449995, -0.98991895, 0.040358)
		fov = 88.0
	}
	time = 0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_outfit_accessories_camera = $ui_customize_character_outfit_camera
ui_customize_left_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.046066, 1.546482, 0.270179)
		quat = (0.035556003, -0.984026, 0.06881999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.289761, -0.057142)
		distfromlookat = 0.52488
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.638781, 1.5398629, -0.353745)
		quat = (0.011906, 0.787423, -0.053563)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.580732, -0.214348)
		distfromlookat = 0.537444
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.55238295, 1.633631, -0.096671)
		quat = (0.08755, -0.75394696, 0.11291199)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.184055, -0.398079)
		distfromlookat = 0.673731
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.353948, 1.494902, -0.84033)
		quat = (0.027297998, 0.35295802, -0.030819)
		fov = 71.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_l
		screenoffset = (0.45521304, -0.216238)
		distfromlookat = 0.698489
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.034777995, 1.4328569, 0.29328197)
		quat = (0.029818, -0.9963799, -0.021507999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.463296, -0.37273502)
		distfromlookat = 0.61401105
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.610831, 1.604391, -0.302508)
		quat = (0.040182002, 0.83119696, -0.111542)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.77938396, -0.133932)
		distfromlookat = 0.714063
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.57762, 1.477523, -0.120675005)
		quat = (0.013915999, -0.76750505, -0.033797998)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.25921202, -0.206506)
		distfromlookat = 0.50186
	}
	time = 0.4
	transitiondof = $dof_car_accl_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.45158398, 1.5248489, -0.78477997)
		quat = (0.054786004, -0.215174, -0.021316)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.24098401, -0.18107802)
		distfromlookat = 0.650774
	}
	time = 0.4
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
ui_customize_character_instrument_camera = $ui_customize_character_body_camera
ui_cag_main_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.108908005, 1.3711101, 2.017348)
		quat = (0.0024110002, -0.995115, 0.026333997)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.313834, 0.43024102)
		distfromlookat = 1.831323
	}
	time = 0.4
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.699049, 1.348148, 0.938652)
		quat = (0.011361001, 0.903393, -0.023878)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.418401, 0.40749303)
		distfromlookat = 1.7950281
	}
	time = 0.4
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.5931051, 1.382533, 0.98494494)
		quat = (0.015651, -0.80478203, 0.021315)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.19309, 0.42905203)
		distfromlookat = 1.8858509
	}
	time = 0.4
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.21759, 1.410695, -1.558754)
		quat = (0.026440999, -0.014589, 0.000392)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.21946202, 0.48311102)
		distfromlookat = 1.8550819
	}
	time = 0.4
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_customize_cag_zoom_camera = $ui_customize_character_zoom_camera
ui_cag_custom_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.108908005, 1.3711101, 2.017348)
		quat = (0.0024110002, -0.995115, 0.026333997)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.313834, 0.43024102)
		distfromlookat = 1.4
	}
	time = 0.4
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.245442, 1.0815331, 0.72823596)
		quat = (1.5E-05, -0.99917096, 0.040672995)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.312383, 0.13920501)
		distfromlookat = 0.533932
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.738311, 1.085381, 0.30204)
		quat = (0.02258, 0.831846, -0.033829)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.286036, 0.09496701)
		distfromlookat = 0.65894604
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.58273995, 1.082043, 0.50826)
		quat = (0.023213001, -0.798427, 0.030943999)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.123587005, 0.06442199)
		distfromlookat = 0.734465
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.113228, 1.0937451, -0.71408796)
		quat = (0.018318, 0.003737, -0.0031960001)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.37451002, 0.23726602)
		distfromlookat = 0.58642
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_zoom_camera = $ui_cag_main_camera
ui_cag_custom_head_camera = {
	params = {
		lockto = $cas_current_player_name
		locktobone = bone_guitar_body
		pos = (0.824845, 0.51643896, -0.044301)
		quat = (0.5089, 0.537358, -0.45749104)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.38476002, 3.0329692)
		distfromlookat = 0.97418696
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.624671, 1.881866, 0.056080002)
		quat = (-0.0059769996, 0.893457, 0.003615)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.38340303, 2.7659082)
		distfromlookat = 1.02023
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.355848, 1.888291, 0.129616)
		quat = (-2.2E-05, -0.84537697, -0.006994)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.31866798, 2.876282)
		distfromlookat = 1.001445
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.077017, 1.8720441, -0.76023996)
		quat = (-0.030073, -0.039215, -0.004902)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.37617102, 2.8170907)
		distfromlookat = 1.0297558
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_zoom_camera = $ui_cag_main_camera
ui_cag_custom_basshead_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.41483003, 1.1995599, 0.609833)
		quat = (0.0063509997, -0.9059029, 0.013595999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.289554, 2.2036443)
		distfromlookat = 1.0697999
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.33678302, 1.474229, 0.746518)
		quat = (0.0029900002, -0.99938595, 0.028589997)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.37859797, 1.1815541)
		distfromlookat = 0.747493
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.809789, 1.4582909, 0.33572)
		quat = (0.010121, 0.8578601, -0.026904998)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.291635, 0.946224)
		distfromlookat = 0.86082804
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.416541, 1.4915589, 0.42265505)
		quat = (0.023382, -0.71706206, 0.016720999)
		fov = 110.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.25679502, 1.2681509)
		distfromlookat = 0.73279095
	}
	time = 0.3
	transitiondof = $dof_car_sel_guitar_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.068557, 1.4069331, -0.56952006)
		quat = (-0.020479, 0.007107, -0.004977)
		fov = 80.0
		lookat = $cas_current_player_name
		lookatbone = bone_guitar_body
		screenoffset = (0.262497, 1.293261)
		distfromlookat = 0.90565896
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
ui_cag_custom_strings_camera = $ui_cag_select_fretboard_camera
ui_cadrm_main_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.123725, 0.736752, 1.779885)
		quat = (0.004954, -0.990612, 0.037352003)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_hub_camera = $ui_cadrm_main_camera
ui_cadrm_main_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-2.2416642, 0.72038794, 0.742061)
		quat = (0.0151929995, 0.914456, -0.034479998)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.833141, 0.75699097, -0.105252005)
		quat = (0.027839, -0.58662295, 0.020184)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_main_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.134916, 1.713671, -1.7159221)
		quat = (0.315081, 0.161199, -0.054398)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_zoom_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.323046, 1.670588, 2.9965918)
		quat = (0.018352, -0.97973096, 0.16855298)
		fov = 90.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_skin_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.197809, 0.58718103, 1.5019821)
		quat = (0.0042820005, -0.9922449, 0.118978)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.1018201, 0.52667594, 1.095773)
		quat = (0.033532, 0.928119, -0.086303994)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.812152, 0.608537, 1.2807381)
		quat = (0.060243998, -0.869831, 0.109817006)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.931125, 1.005495, -1.8140849)
		quat = (0.088741995, 0.30902103, -0.028973)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.17669, 1.160108, 1.583759)
		quat = (0.027836999, -0.968849, 0.20985399)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.6692259, 1.191406, 0.590016)
		quat = (0.07764701, 0.913046, -0.206756)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.8392869, 1.2283821, 0.16552198)
		quat = (0.16785198, -0.64520603, 0.14826702)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_shell_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.164925, 1.6324549, -1.8661559)
		quat = (0.29718596, 0.155912, -0.049255)
		fov = 100.0
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_back_camera = $ui_cad_select_skin_camera
ui_cad_select_drumsticks_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.25760502, 1.1833551, 1.5906509)
		quat = (0.007379, -0.98185396, 0.039079)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.33624202, -0.046096)
		distfromlookat = 1.023046
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.54502904, 1.160148, -0.107861996)
		quat = (-0.0070940005, 0.82234895, 0.008619)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.119086, 0.766531)
		distfromlookat = 0.42074302
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.68972605, 1.156076, -0.28559)
		quat = (-0.008858, -0.540279, -0.0067930003)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.55814207, 0.39212102)
		distfromlookat = 0.851388
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cad_select_drumsticks_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.023418, 1.1577259, -0.640737)
		quat = (-0.011155999, 0.118149005, 0.00039)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_palm_r
		screenoffset = (0.83075, 0.69743603)
		distfromlookat = 0.45029104
	}
	time = 0.3
	transitiondof = $dof_car_sel_drums_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_customize_character_mic_camera = $ui_character_selection_camera
ui_customize_character_mic_main_camera = $ui_customize_character_mic_camera
ui_customize_character_mic_l_camera = $ui_customize_character_l_camera
ui_customize_character_mic_r_camera = $ui_customize_character_r_camera
ui_customize_character_mic_b_camera = $ui_customize_character_b_camera
ui_customize_mic_zoom_camera = $ui_customize_character_zoom_camera
ui_customize_microphone_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.0104829995, 1.4528608, 0.403131)
		quat = (-0.00058800005, -0.99488395, 0.012334)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_mic_microphone
		screenoffset = (0.22147901, 0.029447999)
		distfromlookat = 0.49178898
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_f_camera = $ui_customize_microphone_camera
ui_customize_microphone_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.41594598, 1.4553089, 0.158772)
		quat = (0.00449, 0.913752, -0.0068429997)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_mic_microphone
		screenoffset = (0.227179, 0.042855)
		distfromlookat = 0.471695
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.510704, 1.4507059, 0.024842001)
		quat = (0.006324, -0.7326169, 0.009206999)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_mic_microphone
		screenoffset = (0.21809602, 0.009311)
		distfromlookat = 0.54392505
	}
	time = 0.3
	transitiondof = $dof_car_sel_microphone_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (0.22453098, 1.448326, -0.59127593)
		quat = (0.010859, -0.089655004, 0.0026170001)
		fov = 72.0
		lookat = $cas_current_player_name
		lookatbone = bone_mic_microphone
		screenoffset = (0.430716, 0.004122)
		distfromlookat = 0.559739
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
ui_no_band_camera = {
	params = {
		lockto = world
		pos = (-12.2872505, 2.768528, 23.516026)
		quat = (0.0035930001, 0.917991, -0.031315)
		fov = 87.0
	}
	time = 0.0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
