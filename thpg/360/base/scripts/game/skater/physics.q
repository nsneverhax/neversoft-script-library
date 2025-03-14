skater_default_stats = 5.0
balance_hack_toggle = 1
STATS_AIR = 0
STATS_SPIN = 1
STATS_RAILBALANCE = 2
STATS_LIPBALANCE = 3
STATS_MANUAL = 4
STATS_WALL = 5
STATS_SPECIAL = 6
LEAN_GRAVITY_DIFF = (1.0, 1.0)
LEAN_ACC_DIFF = (1.0, 1.0)
default_friction = 0.025
default_rail_friction = 0.02
sim_mode_grind_friction_mult = 2.0
core_physics_safe_feeler_height = 0.6
skater_physics = {
	skater_autoturn_speed = 3.0
	skater_autoturn_cancel_time = 300
	skater_autoturn_vert_angle = 5
	physics_standing_air_friction = 3E-06
	physics_crouched_air_friction = 1.2E-06
	physics_high_speed_drag = 0.0004
	physics_high_speed_drag_in_air = 0.0004
	Skater_Max_Standing_Kick_Speed_Stat = 4.5
	skater_max_crouched_kick_speed_stat = 9.5
	physics_standing_acceleration_stat = 5.0
	physics_crouching_acceleration_stat = 7.5
	min_uphill_kick_speed = 8.5
	min_uphill_manual_speed = 0.0
	kick_boost_threshold = 21.0
	kick_boost_increase = 5.0
	kick_early_percent = 0.5
	kick_late_percent = 0.5
	kick_bad_kick_drag = 0.2
	kick_delay = 2000
	skater_max_speed_stat = 18.0
	skater_max_speed_stat_kicking = 21.0
	skater_max_max_speed_stat = 38.0
	skater_default_head_height = 1.3
	skater_head_height_for_flips = 1.25
	physics_ground_snap_up = 0.33
	physics_air_snap_up = 0.38000003
	use_new_analog_controls = 1
	physics_turn_ramp_time = 150
	physics_turn_lerp_rate = 0.5
	physics_brake_stick_threshold = 0.4
	brake_anim_delay = 0
	physics_ground_snap_down = 0.2
	skater_first_forward_collision_height = 0.19749999
	skater_first_forward_collision_length = 0.25
	skater_second_forward_collision_length = 0.75
	skater_vehicle_forward_collision_height = 0.65000004
	skater_vehicle_forward_collision_length = 2.0
	skater_min_distance_to_wall = 0.2
	physics_ground_rotation = 1.8
	physics_ground_sharp_rotation = 3.6
	physics_carving_initial_rot = 4.0
	physics_carving_peak_rot = 1.5
	physics_carving_lerp_mult = 1.0
	physics_carving_gravity_mult = 1.5
	spin_count_slop = 60
	physics_air_gravity = -21.6
	physics_ground_gravity = -9.8
	physics_rail_gravity = -18.1
	physics_bail_init_gravity = -21.6
	wall_run_gravity = -15
	additional_downhill_gravity = 10
	additional_downhill_rail_gravity = 0
	run_uphill_gravity_multiplier = 1.5
	gravity_rotation_max_strength = 2.0
	bowl_air_gravity = -60
	Bowl_Ground_Gravity = -70
	Bowl_additional_downhill_gravity = 0
	Bowl_max_kick_speed = 6.0
	ground_stick_angle = 30
	ground_stick_angle_forward = 30
	ground_stick_angle_carving = 30
	pump_up_gravity_mult = -0.1
	pump_down_gravity_mult = 0.25
	pump_effective_duration = 1.0
	pump_enable_half_pumps = 1
	bowl_mode_slomo_percent = 0.55
	bowl_mode_friction_mult = 12.5
	bowl_mode_full_friction_speed = 41.0
	physics_brake_acceleration = 23
	physics_air_no_rotate_time = 150
	physics_air_ramp_rotate_time = 50
	physics_air_no_lean_time = 200
	physics_air_ramp_lean_time = 200
	physics_air_lean_stat = {
		(1.0, 1.0)
		$STATS_SPIN
	}
	physics_air_lean_fast_stat = {
		(6.5, 6.5)
		$STATS_SPIN
	}
	physics_air_rotation_stat = {
		(6.8500004, 7.75)
		$STATS_SPIN
	}
	physics_air_rotation_fast_stat = {
		(7.0, 7.0)
		$STATS_SPIN
	}
	physics_air_tap_turn_speed_stat = {
		(6.8500004, 7.75)
		$STATS_SPIN
	}
	physics_acid_drop_pop_speed = 5
	physics_transfer_speed_limit_override_drop_rate = 0.5
	physics_transfer_speed_limit_override_max = 1.75
	skater_side_collide_height = 0.4
	skater_side_collide_length = 0.38000003
	skater_air_extra_side_col = 0.3
	physics_kick_accel_threshold = 0.25
	physics_kick_uphill_threshold = 0.15
	havok_skater_mass = 80
	havok_skater_weight_scale = 1
	havok_skater_wallplant_scale = 10
	havok_skater_land_impact_scale = 0.4
	havok_skater_grind_impact_scale = 0.5
	havok_skater_jump_impact_scale = 0.4
	havok_skater_grind_impact_upper_speed_clamp = 20.0
	slashgrindfrictionmult = 2.0
	slashgrindheavyfrictionmult = 4.0
	physics_jump_speed_stat = {
		(7.6, 7.6)
		$STATS_AIR
	}
	physics_jump_speed_min_stat = {
		(7.0, 7.6)
		$STATS_AIR
	}
	physics_boneless_jump_speed_stat = {
		(9.3, 10.0)
		$STATS_AIR
	}
	physics_boneless_jump_speed_min_stat = {
		(8.9, 8.9)
		$STATS_AIR
	}
	physics_vert_jump_speed_stat = {
		(5.0, 6.0)
		$STATS_AIR
	}
	physics_vert_jump_speed_min_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_boneless_vert_jump_speed_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_boneless_vert_jump_speed_min_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_launch_jump_speed_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_launch_jump_speed_min_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_boneless_launch_jump_speed_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_boneless_launch_jump_speed_min_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	stall_slip_time = 175
	rail_speed_boost = 3.75
	rail_boost_threshold = 14.0
	rail_speed_boost_uphill = 5.0
	rail_boost_threshold_uphill = 15.0
	point_rail_speed_boost = 5.0
	landing_velocity_factor = 0.35000002
	rail_max_snap = 1.0
	rail_jump_rerail_time = 300
	rail_minimum_rerail_time = 500
	rail_tolerance = 0.7
	rail_tolerance_coping = 0.825
	snap_to_rail_horiz_speed = 0.2
	snap_to_rail_vert_above_speed = 0.1
	snap_to_rail_vert_below_speed = 1.5
	physics_acid_drop_min_land_speed = 12.7
}
sim_mode_physics = {
	skater_autoturn_speed = 3.0
	skater_autoturn_cancel_time = 300
	skater_autoturn_vert_angle = 5
	physics_standing_air_friction = 3E-06
	physics_crouched_air_friction = 1.2E-06
	physics_high_speed_drag = 0.0004
	physics_high_speed_drag_in_air = 0.0004
	Skater_Max_Standing_Kick_Speed_Stat = 4.5
	skater_max_crouched_kick_speed_stat = 8.5
	physics_standing_acceleration_stat = 4.0
	physics_crouching_acceleration_stat = 6.5
	min_uphill_kick_speed = 4.5
	min_uphill_manual_speed = 0.0
	kick_boost_threshold = 19.0
	kick_boost_increase = 2.5
	kick_early_percent = 0.5
	kick_late_percent = 0.5
	kick_bad_kick_drag = 0.2
	kick_delay = 2000
	skater_max_speed_stat = 9.5
	skater_max_speed_stat_kicking = 21.0
	skater_max_max_speed_stat = 38.0
	skater_default_head_height = 1.3
	skater_head_height_for_flips = 1.25
	physics_ground_snap_up = 0.33
	physics_air_snap_up = 0.38000003
	use_new_analog_controls = 1
	physics_turn_ramp_time = 150
	physics_turn_lerp_rate = 0.5
	physics_brake_stick_threshold = 0.4
	brake_anim_delay = 0
	physics_ground_snap_down = 0.2
	skater_first_forward_collision_height = 0.19749999
	skater_first_forward_collision_length = 0.25
	skater_second_forward_collision_length = 0.75
	skater_vehicle_forward_collision_height = 0.65000004
	skater_vehicle_forward_collision_length = 2.0
	skater_min_distance_to_wall = 0.2
	physics_ground_rotation = 1.8
	physics_ground_sharp_rotation = 3.6
	physics_carving_initial_rot = 6.0
	physics_carving_peak_rot = 3.0
	physics_carving_lerp_mult = 1.0
	physics_carving_gravity_mult = 1.5
	spin_count_slop = 60
	physics_air_gravity = -21.6
	physics_ground_gravity = -9.8
	physics_rail_gravity = -18.1
	physics_bail_init_gravity = -21.6
	wall_run_gravity = -15
	additional_downhill_gravity = 15
	additional_downhill_rail_gravity = 15
	run_uphill_gravity_multiplier = 1.5
	gravity_rotation_max_strength = 2.0
	bowl_air_gravity = -60
	Bowl_Ground_Gravity = -70
	Bowl_additional_downhill_gravity = 0
	Bowl_max_kick_speed = 6.0
	ground_stick_angle = 30
	ground_stick_angle_forward = 30
	ground_stick_angle_carving = 30
	pump_up_gravity_mult = -0.1
	pump_down_gravity_mult = 0.25
	pump_effective_duration = 1.0
	pump_enable_half_pumps = 1
	bowl_mode_slomo_percent = 0.55
	bowl_mode_friction_mult = 12.5
	bowl_mode_full_friction_speed = 41.0
	physics_brake_acceleration = 12
	physics_air_no_rotate_time = 150
	physics_air_ramp_rotate_time = 50
	physics_air_no_lean_time = 200
	physics_air_ramp_lean_time = 200
	physics_air_lean_stat = {
		(1.0, 1.0)
		$STATS_SPIN
	}
	physics_air_lean_fast_stat = {
		(6.5, 6.5)
		$STATS_SPIN
	}
	physics_air_rotation_stat = {
		(6.8500004, 7.75)
		$STATS_SPIN
	}
	physics_air_rotation_fast_stat = {
		(7.0, 7.0)
		$STATS_SPIN
	}
	physics_air_tap_turn_speed_stat = {
		(6.8500004, 7.75)
		$STATS_SPIN
	}
	physics_acid_drop_pop_speed = 5
	physics_transfer_speed_limit_override_drop_rate = 0.5
	physics_transfer_speed_limit_override_max = 1.75
	skater_side_collide_height = 0.4
	skater_side_collide_length = 0.38000003
	skater_air_extra_side_col = 0.3
	physics_kick_accel_threshold = 0.25
	physics_kick_uphill_threshold = 0.15
	havok_skater_mass = 80
	havok_skater_weight_scale = 1
	havok_skater_wallplant_scale = 10
	havok_skater_land_impact_scale = 0.4
	havok_skater_grind_impact_scale = 0.5
	havok_skater_jump_impact_scale = 0.4
	havok_skater_grind_impact_upper_speed_clamp = 20.0
	slashgrindfrictionmult = 2.0
	slashgrindheavyfrictionmult = 4.0
	physics_jump_speed_stat = {
		(6.4, 6.4)
		$STATS_AIR
	}
	physics_jump_speed_min_stat = {
		(6.4, 6.4)
		$STATS_AIR
	}
	physics_boneless_jump_speed_stat = {
		(8.0, 8.0)
		$STATS_AIR
	}
	physics_boneless_jump_speed_min_stat = {
		(8.0, 8.0)
		$STATS_AIR
	}
	physics_vert_jump_speed_stat = {
		(5.0, 6.0)
		$STATS_AIR
	}
	physics_vert_jump_speed_min_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_boneless_vert_jump_speed_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_boneless_vert_jump_speed_min_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_launch_jump_speed_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_launch_jump_speed_min_stat = {
		(5.0, 5.0)
		$STATS_AIR
	}
	physics_boneless_launch_jump_speed_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	physics_boneless_launch_jump_speed_min_stat = {
		(6.0, 6.0)
		$STATS_AIR
	}
	stall_slip_time = 300
	rail_speed_boost = 0
	rail_boost_threshold = 14
	rail_speed_boost_uphill = 0
	rail_boost_threshold_uphill = 15.0
	point_rail_speed_boost = 0
	landing_velocity_factor = 0
	rail_max_snap = 0.4
	rail_jump_rerail_time = 300
	rail_minimum_rerail_time = 500
	rail_tolerance = 0.7
	rail_tolerance_coping = 0.7
	snap_to_rail_horiz_speed = 0.2
	snap_to_rail_vert_above_speed = 0.1
	snap_to_rail_vert_below_speed = 0.1
	physics_acid_drop_min_land_speed = 10.0
}
land_effect_display_info = 0
land_effect_impact_speed = 20.0
land_effect_shake_vibrate_duration = 0.0
land_effect_shake_amplitude = 0.0
land_effect_shake_speed = 100.0
land_effect_vibration_percent = 100.0
land_effect_medium_percent = 50.0
land_effect_small_percent = 25.0
Spine_Max_Width = 20.0
physics_recover_rate = 2.0
in_air_vertical_correction_time = 0.2
debug_gravity_adjust = 0
skater_xbox_shoulder_turn_no_rotate_time = 100
physics_air_hang_stat = 0.9
physics_vert_hang_stat = 1.0
physics_acid_drop_min_air_time = 0.25
physics_acid_drop_walking_on_ground_search_distance = 2.54
physics_wallplant_min_approach_angle = 50
physics_disallow_rewallplant_duration = 850
physics_wallplant_speed_loss = 3.175
physics_wallplant_min_exit_speed = 2.5
physics_wallplant_vertical_exit_speed = 3.75
physics_wallplant_disallow_grind_duration = 200
physics_ignore_ceilings_after_wallplant_duration = 200
physics_min_wallplant_height = 0.6096
physics_wallplant_distance_from_wall = 0.70103997
physics_wallplant_duration = 200
physics_late_wallplant_time = 130
physics_vert_wallplant_boost = 7.62
physics_vert_wallplant_forward_tilt = 80
physics_vert_wallplant_distance = 0.9144
physics_vert_wallplant_vertical_velocity_limit = -2.54
physics_vert_wallplant_button_window = 0.1
physics_walking_wallplant_speed = 12.7
physics_ped_wallplant_speed = 12.0
physics_wallplant_delay = 0.0
Physics_flip_bail_angle = 60
physics_disallow_rewallpush_duration = 800
physics_wallpush_speed_loss = 5.08
physics_wallpush_min_exit_speed = 2.54
Physics_Wallpush_Vertical_Exit_Speed = 10.160001
physics_point_rail_kick_upward_angle = 35
physics_time_before_free_revert = 20
physics_bank_pop_vel = 17.78
physics_bank_pop_max_speed = -2.54
bank_ollie_boost_multiplier = 1.5
aggro_kick_ollie_forward_vel_boost = 0.5
aggro_kick_perfect_window = 0.05
aggro_kick_upgraded_perfect_window = 0.08
aggro_wall_push_boost = 4.5
aggro_wall_push_max_speed = 15.0
aggro_wall_push_delay = 500
aggro_wall_push_feeler_length = 1.6
carve_duration = 800
carve_early_window = 100
carve_rotation = 10.0
carve_boost = 3.0
carve_no_boost_speed = 20.0
lip_side_hop_speed = 0.25
lip_side_jump_speed = 5.0
lip_along_jump_speed = 2.5
lip_held_jump_out_time = 300
lip_held_jump_along_time = 300
stallangledotproduct = 0.5
skater_upright_sideways_speed = -60.0
physics_break_air_speed_scale = 0.75
physics_break_air_up_scale = 0.75
skater_break_vert_forward_tilt = 45
skater_vert_allow_break_time = 200
skater_vert_push_time = 130
skater_vert_active_up_time = 250
Skater_Drift_Upright_Speed = 0.3
physics_vert_push_out = 0.075
skater_flip_speed = 1.0
skater_late_jump_slop = 333
skater_max_tense_time = 200
pitch_bail_feeler_length = 1.25
wall_ride_gravity_adjust = {
	(-24.0, -10.0)
	$STATS_WALL
}
special_meter_speed_adj = {
	(1.5, 0.1)
	$STATS_SPECIAL
}
focus_max_times_in_combo_default = 3
focus_time_limit_default = 15.0
focus_max_times_in_combo = 3
focus_time_limit = 15.0
vert_tall_ramp_height = 3.0
vert_low_ramp_height = 0.0
vert_low_ramp_grav_mult = 1.5
normal_lerp_speed = 0.1
end_of_rail_auto_snap = 0.75
auto_rail_rail_max_snap = 0.75
rail_walk_rerail_time = 500
rail_corner_leave_angle = 50
rail_jump_angle = 15
rail_h_lerp = 0.2
rail_v_lerp = 0.125
rail_bad_ledge_side_dist = 0.127
rail_bad_ledge_drop_down_dist = 0.23
bad_movable_rail_check_up = 0.3
bad_movable_rail_check_side = 0.2
slashgrind_switchup_matrix_rotation_time = 0.5
min_balance_vibration = 10.0
wall_bounce_angle_multiplier = 1.1
wall_bounce_dont_slow_angle = 30
wall_bounce_dont_flail_speed = 2.54
wall_non_skatable_angle = 25
wall_bonk_speed_scrub_percent = 0.025
wall_ride_wall_offset = 0.01
wall_ride_min_speed = 2
wall_ride_max_incident_angle = 60
wall_ride_max_tilt = 68.5
wall_ride_upside_down_angle = 53
wall_ride_triangle_window = 0.333
wall_ride_delay = 0.666
wall_ride_down_collision_check_length = -0.25
wall_ride_above = 0.4
wall_ride_target_focus_offset = 1.0
wall_ride_focus_offset_lerp_speed = 3.5
wall_ride_exit_lerp_out_offset_time = 0.5
show_display_matrix = 0
wall_ride_show_axis = 0
Wall_Ride_Show_Frame_Factor = 0
wall_ride_lock_offset = 0.2
wall_ride_offset_angle = 0.5
wall_ride_slerp = 0.05
wall_ride_matrix_lerp_speed = 15.0
wall_ride_turn_speed = 0.004
wall_ride_jump_out_speed = 1.0
wall_ride_jump_up_speed = 2.0
wallrideplant_jump_out_speed = 5.3
wallrun_jump_out_speed = 3.7
skater_max_sloped_turn_cosine = 0.5
skater_slow_turn_on_slopes = 3.0
skater_sloped_turn_max_angle_of_approach = 150
balanceignorebuttonperiod = 0
balancesafebuttonperiod = 1000
manualparams = {
	cheese = {
		(700.0, 700.0)
		$STATS_MANUAL
	}
	cheeseframes = {
		(100.0, 100.0)
		$STATS_MANUAL
	}
	lean_gravity_stat = {
		(0.02, 0.02)
		diff = LEAN_GRAVITY_DIFF
		$STATS_MANUAL
	}
	instable_rate = {
		(0.09, 0.07)
		$STATS_MANUAL
		diff = (1.0, 1.0)
	}
	instable_base = {
		(1.0, 1.0)
		$STATS_MANUAL
	}
	lean_min_speed = {
		(5.0, 5.0)
		$STATS_MANUAL
	}
	lean_rnd_speed = {
		(20.0, 20.0)
		$STATS_MANUAL
	}
	repeat_min = {
		(1.0, 1.0)
		$STATS_MANUAL
	}
	repeat_multiplier = {
		(0.25, 0.25)
		$STATS_MANUAL
	}
	lean_repeat_multiplier = {
		(0.8, 0.8)
		$STATS_MANUAL
	}
	lean_acc = {
		(10.0, 10.0)
		diff = LEAN_ACC_DIFF
		$STATS_MANUAL
	}
	lean_bail_angle = {
		(4000.0, 4000.0)
		$STATS_MANUAL
	}
}
skitchparams = {
	cheese = {
		(700.0, 700.0)
	}
	cheeseframes = {
		(1.0, 1.0)
	}
	lean_gravity_stat = {
		(0.01, 0.01)
	}
	instable_rate = {
		(0.04, 0.04)
	}
	instable_base = {
		(0.5, 0.5)
	}
	lean_min_speed = {
		(5.0, 5.0)
	}
	lean_rnd_speed = {
		(10.0, 10.0)
	}
	repeat_min = {
		(1.0, 1.0)
	}
	repeat_multiplier = {
		(0.25, 0.25)
	}
	lean_repeat_multiplier = {
		(0.8, 0.8)
	}
	lean_acc = {
		(8.0, 8.0)
	}
	lean_bail_angle = {
		(4000.0, 4000.0)
	}
}
grindparams = {
	cheese = {
		(750.0, 750.0)
		$STATS_RAILBALANCE
	}
	cheeseframes = {
		(100.0, 100.0)
		$STATS_RAILBALANCE
	}
	lean_gravity_stat = {
		(0.02, 0.02)
		diff = LEAN_GRAVITY_DIFF
		$STATS_RAILBALANCE
	}
	instable_rate = {
		(0.1, 0.09)
		$STATS_RAILBALANCE
	}
	instable_base = {
		(1.0, 1.0)
		$STATS_RAILBALANCE
	}
	lean_min_speed = {
		(5.0, 5.0)
		$STATS_RAILBALANCE
	}
	lean_rnd_speed = {
		(7.07, 6.0)
		limit = 6
		$STATS_RAILBALANCE
	}
	repeat_min = {
		(1.0, 1.0)
		$STATS_RAILBALANCE
	}
	repeat_multiplier = {
		(0.31, 0.1)
		$STATS_RAILBALANCE
	}
	lean_repeat_multiplier = {
		(0.60700005, 0.5)
		$STATS_RAILBALANCE
	}
	lean_acc = {
		(10.0, 10.0)
		diff = LEAN_ACC_DIFF
		$STATS_RAILBALANCE
	}
	lean_bail_angle = {
		(4000.0, 4000.0)
		$STATS_RAILBALANCE
	}
	same_grind_add_time = {
		(2.0, 2.0)
		$STATS_RAILBALANCE
	}
	new_grind_sub_time = {
		(-0.286, 0.0)
		$STATS_RAILBALANCE
	}
}
lipparams = {
	cheese = {
		(3000.0, 1000.0)
		$STATS_LIPBALANCE
	}
	cheeseframes = {
		(180.0, 180.0)
		$STATS_LIPBALANCE
	}
	lean_gravity_stat = {
		(0.02, 0.02)
		diff = LEAN_GRAVITY_DIFF
		$STATS_LIPBALANCE
	}
	instable_rate = {
		(0.45000002, 0.2)
		$STATS_LIPBALANCE
	}
	instable_base = {
		(1.0, 1.0)
		$STATS_LIPBALANCE
	}
	lean_min_speed = {
		(10.0, 10.0)
		$STATS_LIPBALANCE
	}
	lean_rnd_speed = {
		(20.0, 20.0)
		$STATS_LIPBALANCE
	}
	repeat_min = {
		(1.0, 1.0)
		$STATS_LIPBALANCE
	}
	repeat_multiplier = {
		(1.0, 1.0)
		$STATS_LIPBALANCE
	}
	lean_repeat_multiplier = {
		(1.0, 1.0)
		$STATS_LIPBALANCE
	}
	lean_acc = {
		(10.0, 10.0)
		diff = LEAN_ACC_DIFF
		$STATS_LIPBALANCE
	}
	lean_bail_angle = {
		(4000.0, 4000.0)
		$STATS_LIPBALANCE
	}
}
defaultwobbleparams = {
	wobbleampa = {
		(0.05, 0.05)
		$STATS_MANUAL
	}
	wobbleampb = {
		(0.04, 0.04)
		$STATS_MANUAL
	}
	wobblek1 = {
		(0.0022, 0.0022)
		$STATS_MANUAL
	}
	wobblek2 = {
		(0.0017, 0.0017)
		$STATS_MANUAL
	}
	spazfactor = {
		(1.0, 1.0)
		$STATS_MANUAL
	}
}
bashperiod = 400
bashspeedupfactor = 0.2
bashmaxpercentspeedup = 60
skateinable_horizoffset = 0.76
skateinable_downoffset = 0.18
skateinable_extracheckhorizoffset = 0.3
skateinable_extracheckdownoffset = 61.0
skateinable_liphorizoffset = 0.5
skateinable_lipdownoffset = 0.18
skateinable_lipextracheckhorizoffset = 0.33
skateinable_lipextracheckdownoffset = 61.0
lipallowangle = 25
lipallowangle_override = 60
lipplayerhorizontalangle = 47
liprampvertangle = 68.5
carplant_forward_boost = 10.160001
carplant_upward_boost = 2.54
min_car_height_diff = 1.5239999
min_car_height_downwards = 0.76199996
newspecial = 1
skate_min_wall_lean_push_speed = 25.4
skate_wall_lean_push_time = 0.4
skate_wall_lean_push_length = 0.9
skate_wall_lean_push_height = 0.75
skitch_max_distance = 8
skitch_offset = 0.6858
skitch_suck_speed = 5.08
skitch_speed_match = 1.0
skitch_hold_time = 200
SnowBoard_Friction = 0.3
Snowboard_turn_multiplier = 2.0
cess_turn_min_speed = 1.016
cess_turn_cap_speed = 12.7
cess_turn_multiplier = 1.5
cess_Friction = 0.06
Skater_cess_Flip_Speed = 254.0
slomo_speed = 0.5
Matrix_speed = 0.15
Sim_speed = 1.25
moon_gravity = 0.5
rubber_acc = 0.001
rubber_friction = 0.04
rubber_limit = 25.4
InternetClientCollCoefficient = 4.5
InternetServerCollCoefficient = 3.0
internetclientcollradius = 1.0
internetservercollradius = 0.5
lanclientcollcoefficient = 2.5
lanservercollcoefficient = 1.375
lanclientcollradius = 1.7780001
lanservercollradius = 1.7780001
splitscreencollcoefficient = 1.375
splitscreencollradius = 0.5
ClientCollCoefficient = 20.0
ServerCollCoefficient = 20.0
ClientCollRadius = 1.7780001
ServerCollRadius = 1.7780001
ped_push_dist = 0.6096
ped_push_skater_speed = 10.160001
robot_rail_nudge = 400.0
robot_rail_add_time = 1.0
robot_kick_in = 10
uber_frig_default_height = 120
uber_frig_current_height = 120
trick_mult_degrade_start = 10
natas_spin_factor = 8.5
Physics_Natas_Delay = 0.3
skater_center_of_mass_height = 0.0
manual_path_strength = 1.0
manual_path_radius = 1.0
manual_path_cancel_time = 1500
manual_path_enter_angle = 20
manual_path_input_accumulate_frames = 15
manual_path_input_accumulate_falloff = 0.2
manual_path_clamp_angle = 5
Manual_Path_Must_Steer_Angle = 30
combo_multiplier_range_1_value = 1.0
combo_multiplier_range_1_end = 20
combo_multiplier_range_2_value = 0.5
combo_multiplier_range_2_end = 40
combo_multiplier_range_3_value = 0.2
combo_multiplier_range_3_end = 60
combo_multiplier_range_4_value = 0.1
duration_of_prompt_delay = 4000
duration_of_prompt = 5000
duration_of_prompt_before_fade = 5000
skater_character_collision_params = {
	capsule_height = 2
	capsule_radius = 0.6
}
skater_proxim_trigger_params = {
	cube_length = 0.4
	trigger_checksum = object
}

script delay_vibrate_effect 
	wait <delay> seconds
	default_vibrate_effect percent = <percent> duration = <duration>
endscript

script default_vibrate_effect \{percent = 50
		duration = 1.0}
	if gotparam \{delay}
		obj_spawnscriptnow delay_vibrate_effect params = {<...>}
		return
	endif
	vibrate actuator = 0 percent = <percent> duration = <duration>
	vibrate actuator = 1 percent = <percent> duration = <duration>
endscript
