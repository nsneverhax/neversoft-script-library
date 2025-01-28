camera_default_far_clip = 500.0
camera_fov = 72.0
widescreen_camera_fov = 72.0
compact_camera_fov = 80.0
current_screen_mode = standard_screen_mode
last_screen_mode = standard_screen_mode
camera_1p_farplane_baseline = 200
camera_1p_farplane_adjustment = 200
camera_2p_farplane_baseline = 150
camera_2p_farplane_adjustment = 150
walk_camera_parameters = {
	matrix_slerp_rate = 0.012
	lookaround_slerp_rate = 0.04
	run_slerp_factor = 1.75
	min_slerp_speed = 3.302
	full_slerp_speed = 11.429999
	dpad_min_slerp_speed = 1.2700001
	dpad_full_slerp_speed = 3.81
	flush_slerp_factor = 3
	lock_angle = 135
	facing_control = 1.7
	control_slerp_factor = 1.3
	camera_pos_max_vert_dist = 6.096
	focus_pos_max_offset_up = 0.508
	focus_pos_max_offset_down = 0.76199996
}
Skater_Cam_Behind = 0.35560003
Skater_Cam_Above = 0.101600006
Skater_Cam_Tilt = 0.18
Skater_Cam_Slerp = 0.08
Skater_Cam_Vert_Air_Slerp = 0.025
skater_cam_focus_pos_max_vert_dist = 1.5
skater_cam_focus_pos_max_offset_up = 1.0
skater_cam_focus_pos_max_offset_down = 0.5
skater_cam_pos_lerp = 0.05
skater_cam_end_ollie_pos_lerp = 0.1
skater_cam_end_ollie_focus_lerp = 0.1
skater_cam_end_ollie_frame_count = 7
Skater_Cam_Grind_Lerp = 4.0
focus_mode_cam_height_multiplier = 0.4
focus_mode_cam_vert_air_override = 0.6
camera_lock_button_pressed_time = 300
skater_walking_camera_target_zoom = 1.1
skater_walking_camera_above_val = 1.651
skater_cam_lean_out_transition_time = 1.0
swc_run_cam_tracked_bone = Control_Root
swc_default_focus_height_offset = 1.0
swc_in_air_cam_above_target = 0.5
swc_max_cam_height_above_target = 0.5
swc_max_cam_height_below_target = 0.4
swc_ground_to_cam_height = 0.0
swc_max_distance_from_camera = 2.9
swc_min_distance_from_camera = 2.5
swc_max_distance_from_camera_2p_vert = 3.1
swc_min_distance_from_camera_2p_vert = 2.5
swc_max_distance_from_camera_2p_horz = 4.7
swc_min_distance_from_camera_2p_horz = 2.0
swc_max_zoom_out_speed = 5.0
swc_walk_cam_zoom = 1.165
swc_run_cam_lerp_speed_jump = 2.5
swc_run_cam_lerp_speed_fall = 1.0
swc_lock_jump_cam = 1
swc_run_cam_lerp_speed_jump_run = 3.0
swc_run_cam_lerp_speed_fall_run = 3.0
swc_lock_jump_cam_run = 0
swc_run_to_skate_transition_time = 1.0
swc_run_to_skate_transition_speed = 5.0
swc_run_to_skate_cam_height = 0.95
swc_collision_height_adj = 0.7
swc_collision_left_adj = 0.25
swc_collision_at_adj = 0.1
swc_collision_height_adj_start_dist = 1.0
swc_collision_lerp_back_speed = 1.0
swc_mid_lerp_speed = 3.0
swc_controlled_up_down_speed = 1.7
swc_lerp_out_up_down_speed = 1.0
swc_min_vel_to_lerp_back = 5.0
swc_use_length_lock = 1
swc_run_cam_lerp_speed_default = 8.0
swc_round_off_movement = 1
swc_cam_offset_look_down = (0.1, 1.4, -0.3)
swc_focus_offset_look_down = (0.1, -0.5, 0.3)
swc_cam_offset_look_up = (0.1, 0.0, -0.5)
swc_focus_offset_look_up = (0.1, 0.8, 0.1)
Skater_Camera_Undefined = {
	horiz_fov = 0.0
	behind = 0.0
	above = 0.0
	balance_trick_above = 0.0
	tilt = 0.0
	slerp = 0.0
	vert_air_slerp = 0.0
	vert_air_landed_slerp = 0.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.0
	grind_zoom = 0.0
	origin_offset = 0.0
	wallride_offset_angle = 0.5
	Name = "undefined"
}
Skater_Camera_Standard_Medium = {
	horiz_fov = 81.0
	behind = 2.5
	above = 1.1
	balance_trick_above = 1.1
	tilt = 0.18
	slerp = 0.04
	vert_air_slerp = 0.04
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.2
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.8
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.75
	lip_trick_above = 0.7
	grind_zoom = 1.0
	focus_mode_zoom = 0.625
	focus_mode_lerp = 1.0
	origin_offset = 0.2
	wallride_offset_angle = 0.5
	Name = "standard"
}
Skater_Camera_Standard_Far = {
	horiz_fov = 72.0
	behind = 1.0
	above = 0.45000002
	balance_trick_above = 0.45000002
	tilt = 0.5
	slerp = 1.0
	vert_air_slerp = 1.0
	vert_air_landed_slerp = 1.0
	lerp_xz = 1.0
	lerp_y = 1.0
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 1.0
	big_air_trick_zoom = 0.6
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "far"
}
Skater_Camera_Standard_Near = {
	horiz_fov = 88.0
	behind = 2.1
	above = 1.2
	balance_trick_above = 1.2
	tilt = 0.18
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.9
	lip_trick_zoom = 1.6
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "near"
}
Skater_Camera_Standard_Medium_LTG = {
	horiz_fov = 72.0
	behind = 4.2
	above = 0.6
	balance_trick_above = 0.6
	tilt = 0.15
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.6
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "standard ltg"
}
Skater_Camera_2P_Vert_Medium = {
	horiz_fov = 88.0
	behind = 3.1
	above = 1.2
	balance_trick_above = 1.2
	tilt = 0.18
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.9
	lip_trick_zoom = 1.6
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "standard"
}
Skater_Camera_2P_Vert_Far = {
	horiz_fov = 72.0
	behind = 6.7
	above = 1.8
	balance_trick_above = 1.8
	tilt = 0.3
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.6
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "far"
}
Skater_Camera_2P_Vert_Near = {
	horiz_fov = 72.0
	behind = 1.8
	above = 0.6
	balance_trick_above = 0.6
	tilt = 0.18
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.9
	lip_trick_zoom = 1.6
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "near"
}
Skater_Camera_2P_Vert_Medium_LTG = {
	horiz_fov = 72.0
	behind = 4.2
	above = 0.9
	balance_trick_above = 0.9
	tilt = 0.15
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.6
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "standard ltg"
}
Skater_Camera_2P_Horiz_Medium = {
	horiz_fov = 88.0
	behind = 4.5
	above = 0.8
	balance_trick_above = 1.2
	tilt = 0.120000005
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.9
	lip_trick_zoom = 1.6
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "standard"
}
Skater_Camera_2P_Horiz_Far = {
	horiz_fov = 72.0
	behind = 7.6
	above = 1.0
	balance_trick_above = 1.0
	tilt = 0.3
	slerp = 0.04
	vert_air_slerp = 0.04
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.7
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "far"
}
Skater_Camera_2P_Horiz_Near = {
	horiz_fov = 72.0
	behind = 2.4
	above = 1.0
	balance_trick_above = 1.0
	tilt = 0.18
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 1.0
	lip_trick_zoom = 1.6
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "near"
}
Skater_Camera_2P_Horiz_Medium_LTG = {
	horiz_fov = 72.0
	behind = 4.5
	above = 0.9
	balance_trick_above = 0.9
	tilt = 0.15
	slerp = 0.08
	vert_air_slerp = 0.025
	vert_air_landed_slerp = 0.375
	lerp_xz = 0.25
	lerp_y = 0.75
	vert_air_lerp_xz = 1.0
	vert_air_lerp_y = 1.0
	zoom_lerp = 0.0625
	big_air_trick_zoom = 0.6
	lip_trick_zoom = 1.0
	lip_trick_tilt = -0.8
	lip_trick_above = 0.120000005
	grind_zoom = 1.0
	focus_mode_zoom = 1.0
	focus_mode_lerp = 1.0
	origin_offset = 0.06
	wallride_offset_angle = 0.5
	Name = "standard ltg"
}
Skater_Camera_Array = [
	Skater_Camera_Undefined
	Skater_Camera_Standard_Near
	Skater_Camera_Standard_Medium
	Skater_Camera_Standard_Far
	Skater_Camera_Standard_Medium_LTG
]
Skater_Camera_2P_Vert_Array = [
	Skater_Camera_Undefined
	Skater_Camera_2P_Vert_Near
	Skater_Camera_2P_Vert_Medium
	Skater_Camera_2P_Vert_Far
	Skater_Camera_2P_Vert_Medium_LTG
]
Skater_Camera_2P_Horiz_Array = [
	Skater_Camera_Undefined
	Skater_Camera_2P_Horiz_Near
	Skater_Camera_2P_Horiz_Medium
	Skater_Camera_2P_Horiz_Far
	Skater_Camera_2P_Horiz_Medium_LTG
]

script screen_setup_standard 
	SetScreen \{Aspect = 1.3333334
		Angle = camera_fov
		letterbox = 0}
	Change \{current_screen_mode = standard_screen_mode}
	Printf \{"change to standard"}
endscript

script screen_setup_widescreen 
	SetScreen \{Aspect = 1.7777778
		Angle = $widescreen_camera_fov
		letterbox = 0}
	Change \{current_screen_mode = widescreen_screen_mode}
	Printf \{"change to widescreen"}
endscript

script screen_setup_letterbox 
	SetScreen \{Aspect = 1.7777778
		Angle = $widescreen_camera_fov
		letterbox = 1}
	Change \{current_screen_mode = letterbox_screen_mode}
	Printf \{"change to letterbox"}
endscript

script fake_letterboxing 
	if NOT GotParam \{Remove}
		switch ($current_screen_mode)
			case standard_screen_mode
			fake_letterboxing_elements
			Change \{last_screen_mode = standard_screen_mode}
			case widescreen_screen_mode
			Change \{last_screen_mode = widescreen_screen_mode}
			case letterbox_screen_mode
			Change \{last_screen_mode = letterbox_screen_mode}
			default
			Printf \{"current screen mode = %d"
				D = $current_screen_mode}
			Script_Assert \{"Unrecognized screen mode"}
		endswitch
	else
		switch ($last_screen_mode)
			case standard_screen_mode
			fake_letterboxing_elements \{Remove}
			case widescreen_screen_mode
			Printf \{"last screen mode = %d"
				D = $last_screen_mode}
			NullScript
			case letterbox_screen_mode
			Printf \{"last screen mode = %d"
				D = $last_screen_mode}
			NullScript
			default
			Printf \{"last screen mode = %d"
				D = $last_screen_mode}
			Script_Assert \{"Unrecognized screen mode"}
		endswitch
	endif
endscript

script fake_letterboxing_elements 
	if ScreenElementExists \{Id = letterbox_anchor}
		DestroyScreenElement \{Id = letterbox_anchor}
	endif
	if GotParam \{Remove}
		SetScreen \{Angle = 72.0
			Aspect = 1.3333334}
		return
	else
		SetScreen \{Angle = 72.0
			Aspect = 1.3333334}
	endif
	SetScreenElementLock \{Id = root_window
		OFF}
	CreateScreenElement \{Type = ContainerElement
		Id = letterbox_anchor
		PARENT = root_window
		z_priority = 999
		just = [
			Center
			Center
		]
		internal_just = [
			LEFT
			Top
		]}
	CreateScreenElement \{Type = SpriteElement
		PARENT = letterbox_anchor
		texture = white2
		Scale = (100.0, 9.5)
		Pos = (0.0, -20.0)
		rgba = [
			0
			0
			0
			128
		]
		just = [
			LEFT
			Top
		]
		z_priority = 15}
	CreateScreenElement \{Type = SpriteElement
		PARENT = letterbox_anchor
		texture = white2
		Scale = (100.0, 12.0)
		Pos = (0.0, 392.0)
		rgba = [
			0
			0
			0
			128
		]
		just = [
			LEFT
			Top
		]
		z_priority = 15}
endscript
