nav_ped = {
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = player_turn_speeds
	move_desc = default_move_human
}
nav_player = {
	speeds = player_speeds
	speed_change_angles = player_speed_change_angles
	turn_speeds = player_turn_speeds
	move_desc = player_move_desc
}
default_speeds = {
	min_speed = 1.2
	walk_slow = 1.5
	walk_fast = 2.7
	run_slow = 3.3
	run_fast = 5.1
}
player_speeds = {
	min_speed = 1.2
	walk_slow = 1.8
	walk_fast = 2.7
	run_slow = 3.3
	run_fast = 10.0
}
ped_speeds = {
	min_speed = 1.2
	walk_slow = 1.8
	walk_fast = 2.7
	run_slow = 3.3
	run_fast = 8.0
}
ped_turn_speeds = {
	id = ped_turn_speeds
	stop = 200
	walk_slow = 120
	walk_fast = 120
	run_slow = 100
	run_fast = 100
	min = 600
}
player_turn_speeds = {
	id = player_turn_speeds
	stop = 700
	walk_slow = 700
	walk_fast = 700
	run_slow = 700
	run_fast = 700
	min = 700
}
ped_speed_change_angles = {
	id = ped_speed_change_angles
	stop = 90
	walk_slow = 70
	walk_fast = 50
	run_slow = 20
}
player_speed_change_angles = {
	id = player_speed_change_angles
	stop = 190
	walk_slow = 190
	walk_fast = 190
	run_slow = 190
}
default_lin_accel = 2.5
default_rot_accel = 18.0
default_move = {
	id = default_move
}
standard_move = {
	id = standard_move
	controller_alignment_rules = {
		type = motion_null
	}
	controller_internal_alignment = {
		type = motion_null
	}
	controller_transform_from_environment = {
		type = motion_null
	}
	controller = {
		type = motion_null
	}
	controller_extra_controlled = {
		type = motion_null
	}
	controller_slide = {
		type = motion_null
	}
	controller_extra_uncontrolled = {
		type = motion_null
	}
	controller_transform_to_environment = {
		type = motion_null
	}
	controller_extra_external = {
		type = motion_null
	}
	movement = walk_fast
	crouch_speed = 1.5
	move_speed_scale = 1.0
	max_environment_speed = -1.0
	queuing_buffer_distance = 1.0
	stop_distance = 1.25
	arrival_distance = 1.25
	departure_distance = 1.75
	point_arrival_distance = 0.75
	stopping_distance = 0.5
	starting_distance = 0.5
	outside_boundary = arrive
	path_find = shortest
	stick_to_path = false
	best_turn_arrival = true
	strafe = false
	shuffle = true
	force_align = false
	max_head_hor_rot = 60.0
	lin_accel = $default_lin_accel
	rot_accel = $default_rot_accel
	gravity = -24
}
default_move_human = {
	$standard_move
	id = default_move_human
	stop_angle = 3
	arrival_angle = 3
	departure_angle = 4
	stopping_angle = 2
	starting_angle = 3
	rot_smoothing_factor = 0.0
	strafe = true
}
air_controller_set = {
	id = air_controller_set
	controller_alignment_rules = {
		type = motion_null
	}
	controller_alignment = {
		type = motion_null
	}
	controller_transform_from_environment = {
		type = motion_null
	}
	controller = {
		type = motion_air
	}
	controller_slide = {
		type = motion_null
	}
	controller_transform_to_environment = {
		type = motion_null
	}
}
ground_controller_set = {
	id = ground_controller_set
	controller_alignment_rules = {
		type = motion_standardexternaldesirerules
	}
	controller_alignment = {
		type = motion_standardalignment
	}
	controller_transform_from_environment = {
		type = motion_ground_transformtosurfaceframe
	}
	controller = {
		type = motion_walk
	}
	controller_slide = {
		type = motion_ground_slide
	}
	controller_transform_to_environment = {
		type = motion_ground_transformfromsurfaceframe
	}
}
no_motion_ground_controller_set = {
	$ground_controller_set
	id = no_motion_controller_set
	controller_alignment = {
		type = motion_null
	}
	controller = {
		type = motion_nomotion
	}
	controller_slide = {
		type = motion_null
	}
}
no_motion_rotate_ground_controller_set = {
	$ground_controller_set
	id = no_motion_controller_set
	controller_alignment = {
		type = motion_standardalignment
	}
	controller = {
		type = motion_nomotion
	}
	controller_slide = {
		type = motion_null
	}
}
standard_air_action_group_move_desc = {
	$air_controller_set
	id = standard_air_action_group_move_desc
	rot_accel = 0.0
	lin_accel = 10.0
}
standard_ground_action_group_move_desc = {
	$ground_controller_set
	id = standard_ground_action_group_move_desc
}
rotate_to_face_fast_move_desc = {
	$ground_controller_set
	id = rotate_to_face_fast_move_desc
	rot_accel = 1000.0
	lin_accel = 1000.0
	strafe = true
	turn_speeds = rotate_turn_speed_fast
}
rotate_to_face_fast_move_desc_with_stop = {
	$no_motion_rotate_ground_controller_set
	id = rotate_to_face_fast_move_desc_with_stop
	rot_accel = 1000.0
	lin_accel = 1000.0
	strafe = true
	turn_speeds = rotate_turn_speed_fast
}
rotate_to_face_linear_movement_move_desc = {
	$no_motion_rotate_ground_controller_set
	id = rotate_to_face_linear_movement_move_desc
	rot_accel = 1000.0
	lin_accel = 1000.0
	strafe = true
	turn_speeds = rotate_turn_speed_fast
	controller = {
		type = motion_linearmotion
		linear_motion_velocity = (0.0, 0.0, 5.0)
	}
}
charge_move_desc = {
	$ground_controller_set
	id = charge_move_desc
	rot_accel = 1000.0
	lin_accel = 1000.0
	strafe = true
	turn_speeds = rotate_turn_speed_fast
	controller = {
		type = motion_linearmotion
		linear_motion_velocity = (0.0, 0.0, 150.0)
	}
}

script registermovementspeeds 
	movement_clearallspeeds
	movement_clearallturnspeeds
	movement_clearallspeedchangeangles
	movement_clearalldescriptions
	movement_registerspeeds \{id = ped_speeds
		struct = $ped_speeds}
	movement_registerspeeds \{id = player_speeds
		struct = $player_speeds}
	movement_registerturnspeeds \{$ped_turn_speeds}
	movement_registerturnspeeds \{$player_turn_speeds}
	movement_registerspeedchangeangles \{$ped_speed_change_angles}
	movement_registerspeedchangeangles \{$player_speed_change_angles}
endscript
