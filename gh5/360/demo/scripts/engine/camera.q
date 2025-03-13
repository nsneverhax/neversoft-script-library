camera_default_far_clip = 500.0
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
skater_cam_behind = 0.35560003
skater_cam_above = 0.101600006
skater_cam_tilt = 0.18
skater_cam_slerp = 0.08
skater_cam_vert_air_slerp = 0.025
skater_cam_focus_pos_max_vert_dist = 1.5
skater_cam_focus_pos_max_offset_up = 1.0
skater_cam_focus_pos_max_offset_down = 0.5
skater_cam_pos_lerp = 0.05
skater_cam_end_ollie_pos_lerp = 0.1
skater_cam_end_ollie_focus_lerp = 0.1
skater_cam_end_ollie_frame_count = 7
skater_cam_grind_lerp = 4.0
focus_mode_cam_height_multiplier = 0.4
focus_mode_cam_vert_air_override = 0.6
camera_lock_button_pressed_time = 300
skater_walking_camera_target_zoom = 1.1
skater_walking_camera_above_val = 1.651
skater_cam_lean_out_transition_time = 1.0
swc_run_cam_tracked_bone = control_root
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
skater_camera_undefined = {
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
	name = qs(0x0a5892d2)
}
skater_camera_standard_medium = {
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
	name = qs(0x7e4cc0db)
}
skater_camera_standard_far = {
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
	name = qs(0x815141b8)
}
skater_camera_standard_near = {
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
	name = qs(0x3a166e41)
}
skater_camera_standard_medium_ltg = {
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
	name = qs(0xe1b306a4)
}
skater_camera_2p_vert_medium = {
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
	name = qs(0x7e4cc0db)
}
skater_camera_2p_vert_far = {
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
	name = qs(0x815141b8)
}
skater_camera_2p_vert_near = {
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
	name = qs(0x3a166e41)
}
skater_camera_2p_vert_medium_ltg = {
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
	name = qs(0xe1b306a4)
}
skater_camera_2p_horiz_medium = {
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
	name = qs(0x7e4cc0db)
}
skater_camera_2p_horiz_far = {
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
	name = qs(0x815141b8)
}
skater_camera_2p_horiz_near = {
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
	name = qs(0x3a166e41)
}
skater_camera_2p_horiz_medium_ltg = {
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
	name = qs(0xe1b306a4)
}
skater_camera_array = [
	skater_camera_undefined
	skater_camera_standard_near
	skater_camera_standard_medium
	skater_camera_standard_far
	skater_camera_standard_medium_ltg
]
skater_camera_2p_vert_array = [
	skater_camera_undefined
	skater_camera_2p_vert_near
	skater_camera_2p_vert_medium
	skater_camera_2p_vert_far
	skater_camera_2p_vert_medium_ltg
]
skater_camera_2p_horiz_array = [
	skater_camera_undefined
	skater_camera_2p_horiz_near
	skater_camera_2p_horiz_medium
	skater_camera_2p_horiz_far
	skater_camera_2p_horiz_medium_ltg
]

script screen_setup_standard 
	setscreen \{aspect = 1.3333334
		angle = camera_fov
		letterbox = 0}
	change \{current_screen_mode = standard_screen_mode}
	printf \{qs(0x502b5a6e)}
endscript

script screen_setup_widescreen 
	setscreen \{aspect = 1.7777778
		angle = $widescreen_camera_fov
		letterbox = 0}
	change \{current_screen_mode = widescreen_screen_mode}
	printf \{qs(0x41e25f69)}
endscript

script screen_setup_letterbox 
	setscreen \{aspect = 1.7777778
		angle = $widescreen_camera_fov
		letterbox = 1}
	change \{current_screen_mode = letterbox_screen_mode}
	printf \{qs(0xcaaa8599)}
endscript

script fake_letterboxing 
	if NOT gotparam \{remove}
		switch ($current_screen_mode)
			case standard_screen_mode
			fake_letterboxing_elements
			change \{last_screen_mode = standard_screen_mode}
			case widescreen_screen_mode
			change \{last_screen_mode = widescreen_screen_mode}
			case letterbox_screen_mode
			change \{last_screen_mode = letterbox_screen_mode}
			default
			printf \{qs(0xe4cf3554)
				d = $current_screen_mode}
			script_assert \{qs(0xbf9a965b)}
		endswitch
	else
		switch ($last_screen_mode)
			case standard_screen_mode
			fake_letterboxing_elements \{remove}
			case widescreen_screen_mode
			printf \{qs(0xbeb288ee)
				d = $last_screen_mode}
			nullscript
			case letterbox_screen_mode
			printf \{qs(0xbeb288ee)
				d = $last_screen_mode}
			nullscript
			default
			printf \{qs(0xbeb288ee)
				d = $last_screen_mode}
			script_assert \{qs(0xbf9a965b)}
		endswitch
	endif
endscript

script fake_letterboxing_elements 
	if screenelementexists \{id = letterbox_anchor}
		destroyscreenelement \{id = letterbox_anchor}
	endif
	if gotparam \{remove}
		setscreen \{angle = 72.0
			aspect = 1.3333334}
		return
	else
		setscreen \{angle = 72.0
			aspect = 1.3333334}
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{type = containerelement
		id = letterbox_anchor
		parent = root_window
		z_priority = 999
		just = [
			center
			center
		]
		internal_just = [
			left
			top
		]}
	createscreenelement \{type = spriteelement
		parent = letterbox_anchor
		texture = white
		scale = (200.0, 19.0)
		pos = (0.0, -20.0)
		rgba = [
			0
			0
			0
			128
		]
		just = [
			left
			top
		]
		z_priority = 15}
	createscreenelement \{type = spriteelement
		parent = letterbox_anchor
		texture = white
		scale = (200.0, 24.0)
		pos = (0.0, 392.0)
		rgba = [
			0
			0
			0
			128
		]
		just = [
			left
			top
		]
		z_priority = 15}
endscript
