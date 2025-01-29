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
		pos = (-28.344543, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
}
ui_mainmenu_intro_camera = $ui_mainmenu_camera
ui_guitarhero_com_camera = $ui_mainmenu_camera
ui_motd_camera = $ui_mainmenu_camera
ui_band_name_logo_camera = {
	params = {
		pos = (-28.344543, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
	}
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
ui_game_mode_camera = {
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
ui_select_difficulty_camera = $ui_game_mode_camera
ui_select_instrument_camera = $ui_game_mode_camera
ui_band_name_enter_camera = $ui_game_mode_camera
ui_band_choose_camera = $ui_game_mode_camera
ui_band_logo_choose_camera = $ui_game_mode_camera
ui_group_play_camera = $ui_game_mode_camera
ui_select_mp_mode_camera = $ui_game_mode_camera
ui_band_logo_choose_edit_camera = {
	params = {
		pos = (-30.006302, 0.150134, 5.2766047)
		quat = (-0.016580999, -0.99825096, 0.013075999)
	}
	time = 0.35000002
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
}
ui_options_camera = {
	params = {
		pos = (-27.100414, 0.27381703, 4.8500004)
		quat = (-0.002024, 0.99504197, 0.09725501)
	}
	time = 0.35000002
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
}
ui_top_rockers_mode_camera = $ui_options_camera
ui_downloads_camera = {
	params = {
		pos = (-28.0003, 0.086454, 3.453506)
		quat = (-0.00375, 0.9962319, 0.064155)
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
ui_gig_posters_camera = {
	params = {
		pos = (2.059494, 1.2361621, 3.563647)
		quat = (0.004165, -0.91177493, 0.009250999)
		fov = 73.0
	}
	time = 0
}
ui_band_hub_camera = {
	params = {
		pos = (0.444145, 1.6750801, 5.6426005)
		quat = (0.09144401, -0.74900204, 0.105756)
	}
	time = 0
}
ui_character_hub_camera = {
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
ui_select_controller_camera = {
	params = {
		pos = (-28.0003, 0.086454, 3.453506)
		quat = (-0.00375, 0.9962319, 0.064155)
	}
	time = 0.35000002
	transitiondof = $dof_closeup02_tod_manager
	dof = $dof_uiblur_tod_manager
}
ui_select_practice_mode_camera = {
	params = {
		pos = (-4.3706923, 1.6603589, 13.46266)
		quat = (0.015245, 0.9728369, -0.067448005)
	}
	time = 0
}
ui_select_tutorial_camera = $ui_select_practice_mode_camera
ui_practice_select_part_camera = $ui_select_practice_mode_camera
ui_practice_select_speed_camera = $ui_select_practice_mode_camera
ui_select_song_section_camera = $ui_select_practice_mode_camera
ui_special_events_camera = $ui_select_practice_mode_camera
ui_character_selection_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-0.704085, 1.873141, 5.258747)
		quat = (0.088123, -0.82403696, 0.13362099)
	}
	time = 0
	transitiondof = $dof_car_selchar_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_singleplayer_character_hub_camera = $ui_character_selection_camera
ui_customize_character_body_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (2.579794, 1.2775071, -0.212734)
		quat = (0.000221, 0.998518, -0.053729)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_create_character_gender_camera = $ui_customize_character_body_camera
ui_create_character_genre_camera = $ui_create_character_gender_camera
ui_customize_character_camera = $ui_create_character_gender_camera
ui_customize_character_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-0.56178796, 1.2039571, -3.589012)
		quat = (0.029352, 0.73020095, -0.031156)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (6.2620325, 0.91979396, -2.607563)
		quat = (0.00020099999, -0.73142993, 0.00033500002)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (2.9667401, 1.228203, -6.321822)
		quat = (0.048579, 0.078579, -0.0037170001)
	}
	time = 0.4
	transitiondof = $dof_car_selgender_tod_manager
	dof = $dof_car_selgender_tod_manager
}
ui_customize_character_zoom_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (2.553012, 1.3557069, 0.51200795)
		quat = (0.00050300005, -0.998549, 0.053712)
	}
	time = 0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_presence_zoom_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.9392712, 1.483641, 1.2132651)
		quat = (0.010019, -0.983898, 0.057528)
	}
	time = 0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_customize_character_head_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.00301, 1.6, 1.2)
		quat = (0.0051659998, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.2, 0.65000004)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_character_face_deformation_camera = $ui_customize_character_head_camera
ui_character_face_deformation_options_camera = $ui_customize_character_head_camera
ui_customize_character_head_l_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-1.1, 1.6, 0.1)
		quat = (-0.0075000003, 0.75, -0.01)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.05, 0.65000004)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_r_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (1.3, 1.6, 0.127701)
		quat = (-0.0075000003, -0.75, 0.0)
		fov = 35.0
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.3, 0.65000004)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_head_b_camera = {
	params = {
		lockto = $cas_current_player_name
		pos = (-0.00301, 1.6, -1.2)
		quat = (0.0051659998, -1.0, -0.01)
		fov = 35
		lookat = $cas_current_player_name
		lookatbone = bone_neck
		screenoffset = (0.2, 0.65000004)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_tat_torso_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.58252, 1.577357, -1.6718001)
		quat = (0.002092, 0.997189, -0.068486996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (0.987154, 1.586909, -2.764546)
		quat = (0.052789003, 0.79899293, -0.070923)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (4.3706474, 1.664935, -2.625755)
		quat = (0.059632998, -0.77193093, 0.073159)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_tat_torso_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.083645, 1.437092, -4.571922)
		quat = (-0.007211, -0.009102999, 4.6999998E-05)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_character_body_art_camera = $ui_customize_tat_torso_camera
ui_customize_tat_left_arm_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.4303842, 1.52186, -1.279151)
		quat = (0.041360997, -0.953241, 0.15332001)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (1.6916201, 1.4483941, -2.422022)
		quat = (0.065292, 0.73549694, -0.071779)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (4.0632067, 1.4019221, -2.066564)
		quat = (0.09559201, -0.70725, 0.097049005)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_left_arm_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.544405, 1.3581529, -2.9804041)
		quat = (0.073348, -0.31130698, 0.024151001)
		fov = 100
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_l_tod_manager
}
ui_customize_tat_right_arm_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (2.408536, 1.3553499, -1.341427)
		quat = (0.027535997, 0.97087795, -0.137715)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (1.913538, 1.395221, -2.191275)
		quat = (0.06547099, 0.776162, -0.081232004)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (4.1939325, 1.541618, -2.375696)
		quat = (0.109372, -0.60758305, 0.084747)
		fov = 72.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_tat_right_arm_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.302931, 1.1622629, -2.737759)
		quat = (0.060427, -0.192728, 0.0116759995)
		fov = 100.0
	}
	time = 1
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_tat_r_tod_manager
}
ui_customize_character_stage_presence_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.68956, 1.398296, 0.5071111)
		quat = (0.009319, -0.984142, 0.053426)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_stage_presence_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (-0.76758903, 1.396427, -2.346771)
		quat = (0.031855, 0.805513, -0.043750998)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_stage_presence_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (6.695607, 1.4930321, -2.484208)
		quat = (0.038818996, -0.69654, 0.037425)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_stage_presence_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		pos = (3.5610158, 1.112193, -6.216054)
		quat = (0.020193998, -0.025877, 0.000342)
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selchar_tod_manager
}
ui_customize_character_outfit_camera = {
	params = {
		lockto = world
		pos = (4.3502183, 0.96028095, -0.56539696)
		quat = (0.000778, -0.956392, 0.002553)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_main_tod_manager
}
ui_customize_torso_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.58252, 1.577357, -1.6718001)
		quat = (0.002092, 0.997189, -0.068486996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (1.229928, 1.575858, -2.84144)
		quat = (0.037047997, 0.833772, -0.056533)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (4.6904464, 1.608268, -2.6730719)
		quat = (0.050649, -0.76214397, 0.059878998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_torso_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.3062832, 1.651783, -4.8541756)
		quat = (0.066957004, -0.015912, 0.00090399996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.45309, 0.409987, -1.4605519)
		quat = (-0.0024020001, 0.9972879, 0.04294)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (0.838641, 0.409372, -3.0130541)
		quat = (-0.026466997, 0.7952429, 0.034964)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (4.85338, 0.368829, -3.258328)
		quat = (-0.032204997, -0.662159, -0.028399998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_pants_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.708544, 0.344926, -5.076928)
		quat = (-0.042502, -0.126972, -0.0051929997)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.006176, 0.25083303, -1.4597619)
		quat = (0.005938, -0.99366695, 0.068270996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.271051, 0.165897, -2.255542)
		quat = (0.037774, 0.83067095, -0.056380004)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.779936, 0.260597, -1.8158089)
		quat = (0.029408999, -0.845578, 0.046866)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_shoes_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.254224, 0.232112, -3.1027591)
		quat = (0.092681, -0.035655, 0.003591)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_selecttorso_tod_manager
}
ui_customize_character_outfit_accessories_camera = $ui_customize_character_outfit_camera
ui_customize_left_arm_camera = {
	params = {
		lockto = world
		pos = (3.4590871, 1.317094, -1.9689779)
		quat = (-0.048584003, -0.886823, -0.096260004)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_l_camera = {
	params = {
		lockto = world
		pos = (2.4253652, 1.351534, -2.22141)
		quat = (-0.037729003, 0.89221597, 0.07549301)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_r_camera = {
	params = {
		lockto = world
		pos = (3.603169, 1.306352, -2.4859562)
		quat = (-0.083031, -0.633057, -0.068790995)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_left_arm_b_camera = {
	params = {
		lockto = world
		pos = (2.564075, 1.4895729, -3.0340881)
		quat = (0.0054889997, 0.45031303, -0.0029580002)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.03609, 1.542038, -1.781651)
		quat = (0.00024, -0.99931896, 0.0064509995)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.494709, 1.5397909, -2.2400591)
		quat = (0.015379, 0.845384, -0.024394998)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.786987, 1.540694, -2.393329)
		quat = (0.015225, -0.639398, 0.012697)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_right_arm_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.307752, 1.543215, -2.9996393)
		quat = (0.020177, -0.056980003, 0.0011489999)
		fov = 72.0
	}
	time = 0.8
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_accl_tod_manager
}
ui_customize_face_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.0408258, 1.5142471, -2.2781508)
		quat = (-0.005829, -0.98906994, -0.040585)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_hat_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.927851, 1.6434659, -2.175929)
		quat = (0.001947, -0.9968769, 0.027490998)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_piercings_camera = $ui_customize_character_head_camera
ui_customize_character_hair_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.0593917, 1.61913, -2.400129)
		quat = (0.0016050001, -0.99083996, 0.0117029995)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_l_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.010598, 1.615367, -3.3456893)
		quat = (0.01416, 0.75107694, -0.016181)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_r_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (3.934823, 1.619957, -3.300868)
		quat = (0.00946, -0.648634, 0.008011)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_hair_b_camera = {
	controlscript = cameracuts_handcam
	params = {
		lockto = world
		pos = (2.9718459, 1.604105, -4.29257)
		quat = (-0.005748, 0.11969901, 0.00070599996)
		fov = 72.0
	}
	time = 0.4
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_glasses_tod_manager
}
ui_customize_character_instrument_camera = {
	params = {
		lockto = world
		pos = (0.515432, 1.5286509, -5.3907733)
		quat = (-0.0057320003, 0.467209, 0.003029)
		fov = 72.0
	}
	time = 0.5
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_instr_tod_manager
}
ui_cag_main_camera = {
	params = {
		lockto = world
		pos = (7.1332607, 1.0810981, 4.9638762)
		quat = (-0.051845998, 0.7828869, 0.065837)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_l_camera = {
	params = {
		lockto = world
		pos = (8.513189, 1.09767, 3.198443)
		quat = (-0.08935, 0.21649201, 0.019901)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_r_camera = {
	params = {
		lockto = world
		pos = (8.572055, 0.98737997, 6.357395)
		quat = (-0.014289999, 0.9856969, 0.121359006)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_main_b_camera = {
	params = {
		lockto = world
		pos = (10.723132, 1.22509, 5.061426)
		quat = (-0.033912, -0.73661494, -0.037038)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_customize_cag_zoom_camera = {
	params = {
		lockto = world
		pos = (7.538249, 1.026929, 5.046952)
		quat = (-0.069049, 0.79575497, 0.092419)
		fov = 72.0
	}
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_camera = $ui_cag_main_camera
ui_cag_custom_body_camera = {
	params = {
		lockto = world
		pos = (7.9195194, 1.1188589, 4.9365726)
		quat = (-0.012337, 0.77234495, 0.0150069995)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_l_camera = {
	params = {
		lockto = world
		pos = (8.4622755, 1.1188589, 3.7561781)
		quat = (-0.018462999, 0.31114197, 0.006046)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_r_camera = {
	params = {
		lockto = world
		pos = (8.497575, 1.1134471, 5.8785853)
		quat = (-0.0025310002, 0.983809, 0.013935999)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_body_b_camera = {
	params = {
		lockto = world
		pos = (10.297553, 1.106879, 4.7939787)
		quat = (-0.011357, -0.64336306, -0.009546)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_camera = {
	params = {
		lockto = world
		pos = (8.1813755, 1.874804, 4.858207)
		quat = (-0.030912, 0.78604895, 0.039436)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_l_camera = {
	params = {
		lockto = world
		pos = (8.4547615, 1.874804, 4.009616)
		quat = (-0.046817996, 0.35588104, 0.017854)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_r_camera = {
	params = {
		lockto = world
		pos = (8.7150545, 1.8762481, 5.6441674)
		quat = (-0.0062320004, 0.99099195, 0.049717996)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_head_b_camera = {
	params = {
		lockto = world
		pos = (9.851452, 1.85373, 4.773564)
		quat = (-0.038969, -0.62783206, -0.031499)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_basshead_camera = {
	params = {
		lockto = world
		pos = (8.282441, 1.961865, 5.097465)
		quat = (-0.027128998, 0.83970696, 0.042128)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_camera = {
	params = {
		lockto = world
		pos = (8.11587, 1.416816, 4.8338785)
		quat = (-0.045152, 0.749616, 0.051410995)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_l_camera = {
	params = {
		lockto = world
		pos = (8.597752, 1.416816, 3.9841957)
		quat = (-0.065262, 0.299759, 0.020558)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_r_camera = {
	params = {
		lockto = world
		pos = (8.508895, 1.393021, 5.5539145)
		quat = (-0.017724998, 0.963602, 0.066087)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_select_fretboard_b_camera = {
	params = {
		lockto = world
		pos = (8.11587, 1.416816, 4.8338785)
		quat = (-0.045152, 0.749616, 0.051410995)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_tod_manager
}
ui_cag_custom_hardware_camera = {
	params = {
		lockto = world
		pos = (8.279569, 1.1110431, 4.858363)
		quat = (0.006996, 0.75294393, -0.008007)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_hardware_tod_manager
}
ui_cag_custom_hardware_l_camera = {
	params = {
		lockto = world
		pos = (8.74328, 1.1110431, 4.033134)
		quat = (-0.023586, 0.226384, 0.0054829996)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_hardware_tod_manager
}
ui_cag_custom_hardware_r_camera = {
	params = {
		lockto = world
		pos = (8.706615, 1.1110431, 5.4357634)
		quat = (0.0021130003, 0.9799749, -0.010421)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_hardware_tod_manager
}
ui_cag_custom_hardware_b_camera = {
	params = {
		lockto = world
		pos = (9.930282, 1.1095569, 4.830355)
		quat = (-0.0187, -0.66112906, -0.016489)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_guitar_hardware_tod_manager
}
ui_cag_custom_strings_camera = {
	params = {
		pos = (8.025836, 1.2017422, 0.817294)
		quat = (0.059704002, 0.72327095, -0.06303701)
	}
	time = 0.3
}
ui_cadrm_main_camera = {
	params = {
		pos = (7.626858, 1.7709501, -0.81576604)
		quat = (0.053464, 0.81314903, -0.075652)
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_camera = {
	params = {
		pos = (9.44337, 0.9896299, -1.336537)
		quat = (0.125172, 0.740267, -0.143719)
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_l_camera = {
	params = {
		pos = (9.42236, 0.840201, -2.2464783)
		quat = (0.05337, 0.47280902, -0.028703)
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_skin_r_camera = {
	params = {
		pos = (9.695037, 0.897915, -0.39015302)
		quat = (0.025938, 0.96183795, -0.098185)
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_back_camera = {
	params = {
		lockto = world
		pos = (12.39573, 2.026932, -0.44383)
		quat = (0.120400004, -0.742754, 0.138905)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cadrm_hub_camera = $ui_cadrm_main_camera
ui_cad_select_size_camera = {
	params = {
		lockto = world
		pos = (7.4936337, 2.458928, -0.65872407)
		quat = (0.104178004, 0.815919, -0.15537001)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_main_tod_manager
}
ui_cad_select_shell_camera = {
	params = {
		lockto = world
		pos = (9.453998, 1.686456, -3.396493)
		quat = (0.120521, 0.38282603, -0.05045)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_skin_camera = {
	params = {
		lockto = world
		pos = (8.21873, 0.94351107, -1.3301979)
		quat = (0.015362, 0.76230294, -0.018103)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_cad_select_drumsticks_camera = {
	params = {
		lockto = world
		pos = (9.933798, 1.5534699, -1.1540959)
		quat = (-0.00371, 0.79761297, 0.00491)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drumsticks_tod_manager
}
ui_cadrm_zoom_camera = {
	params = {
		pos = (6.751408, 1.945275, -0.505685)
		quat = (0.056385003, 0.790026, -0.073501)
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_drums_tod_manager
}
ui_customize_character_mic_camera = {
	params = {
		lockto = world
		pos = (5.3300505, 1.3349129, 6.237978)
		quat = (0.011565001, 0.56542206, -0.007929001)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_main_camera = $ui_customize_character_mic_camera
ui_customize_character_mic_l_camera = {
	params = {
		lockto = world
		pos = (9.456195, 1.3247498, 5.195224)
		quat = (0.013668, -0.223131, 0.003129)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_r_camera = {
	params = {
		lockto = world
		pos = (5.964231, 1.326442, 8.741877)
		quat = (0.015261999, 0.897932, -0.031233998)
		fov = 80.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_character_mic_b_camera = {
	params = {
		lockto = world
		pos = (9.441744, 1.3240888, 8.4572525)
		quat = (0.017733, -0.844683, 0.028038999)
		fov = 90.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_mic_zoom_camera = {
	params = {
		lockto = world
		pos = (4.5162563, 1.3593869, 5.923488)
		quat = (0.011565001, 0.56542206, -0.007929001)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_micstand_tod_manager
}
ui_customize_microphone_camera = {
	params = {
		lockto = world
		pos = (7.482661, 1.8087159, 6.485554)
		quat = (0.025770001, 0.264277, -0.007062)
		fov = 72.0
	}
	time = 0.0
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_f_camera = {
	params = {
		lockto = world
		pos = (7.482661, 1.8087159, 6.485554)
		quat = (0.025770001, 0.264277, -0.007062)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_l_camera = {
	params = {
		lockto = world
		pos = (7.9191303, 1.8049569, 6.603429)
		quat = (0.009803999, -0.14385399, 0.0014270002)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_r_camera = {
	params = {
		lockto = world
		pos = (7.052484, 1.808713, 7.1684747)
		quat = (0.016017, 0.783572, -0.020215)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
	dof = $dof_car_sel_microphone_tod_manager
}
ui_customize_microphone_b_camera = {
	params = {
		lockto = world
		pos = (7.5951033, 1.7887181, 7.7118473)
		quat = (0.000405, -0.995362, 0.0042160004)
		fov = 72.0
	}
	time = 0.3
	transitiondof = $dof_car_main_tod_manager
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
