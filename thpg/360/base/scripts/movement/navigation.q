collision_enabled = 1
old_hero_collision = 0
hero_nav_collision_test = 0
navcol_walking_debug_lines = 0
navcol_test_with_sectors = 0
navcol_feeler_length = 0.6
navcol_feeler_height = 0.4
show_static_residents = 0
enable_horse_dead_collision = 0
nav_max_destination_distance = 900
intercept_velocity_based = 1
intercept_desired_speed = 10.0
intercept_direct_steer_dist = 2.0
intercept_direct_angle_deg = 10
vert_blend_acceleration = 9.5
vert_blend_step_velocity_up = 0.55
vert_blend_max_velocity_up = 10.0
vert_blend_min_velocity_up = 2.5
vert_blend_displacement_for_max_velocity_up = 0.375
vert_blend_displacement_for_min_velocity_up = 0.125
start_falling_height = 2.5
stop_falling_height = 0.5

script Toggle_Hero_Nav_Collision_Test 
	if (hero_nav_collision_test = 1)
		change \{hero_nav_collision_test = 0}
	else
		change \{hero_nav_collision_test = 1}
	endif
endscript

script Toggle_Nav_Collision_Sector_Test 
	if (navcol_test_with_sectors = 1)
		change \{navcol_test_with_sectors = 0}
	else
		change \{navcol_test_with_sectors = 1}
	endif
endscript
min_push_constant = 0.7
min_static_push_constant = 2.5
min_static_push_constant_driver = 0.3
hero_min_push_constant = 2.0
hero_max_push_speed = 8.0
default_push_out_speed = 0.6
avoidance_enabled = 1
show_avoidance = 0
avoidance_path_update_delay = 0.0
avoidance_steering_length_sensitivity = 1.2
avoidance_wall_follow_snap_degrees = 50.0
avoidance_vel_to_wall_search_distance_scale = 0.8
avoidance_min_search_distance = 1.2
avoidance_max_search_distance = 8
avoidance_min_avoidance_strength = 1.1
avoidance_resident_search_to_grab_distance_ratio = 2.0
avoidance_slowest_speed = 0.075
avoidance_treat_as_equal_speed_difference = 0.125
avoidance_movement_direction_change_angle = 150.0
avoidance_movement_speed_change_angle = 90.0
avoidance_considered_stopped_speed = 0.1125
avoidance_buffer_dist = 4.0
movableprops_hero = {
	traveler = terrain_anywhere
	self_move = false
	self_orient = false
	incident_move = true
	incident_orient = true
	steer_move = false
	steer_orient = false
}
movableprops_ped = {
	traveler = terrain_ped_trivial
	self_move = true
	self_orient = true
	incident_move = true
	incident_orient = true
	steer_move = true
	steer_orient = true
}
movableprops_ped_urgent = {
	traveler = terrain_ped_urgent
	self_move = true
	self_orient = true
	incident_move = true
	incident_orient = true
	steer_move = true
	steer_orient = true
}
movableprops_no_push = {
	traveler = terrain_ped_trivial
	self_move = true
	self_orient = true
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
movableprops_skater = {
	traveler = terrain_skater_trivial
	self_move = true
	self_orient = true
	incident_move = true
	incident_orient = true
	steer_move = false
	steer_orient = false
}
movableprops_rigpiece = {
	traveler = terrain_anywhere
	self_move = false
	self_orient = false
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
movableprops_vehicle = {
	traveler = terrain_anywhere
	self_move = true
	self_orient = true
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
movableprops_animal = {
	traveler = terrain_animal_trivial
	self_move = true
	self_orient = true
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
movableprops_obj = {
	traveler = terrain_anywhere
	self_move = true
	self_orient = true
	incident_move = true
	incident_orient = true
	steer_move = true
	steer_orient = true
}
movableprops_fixed = {
	traveler = terrain_anywhere
	self_move = false
	self_orient = false
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
movableprops_empty = {
	traveler = terrain_anywhere
	self_move = false
	self_orient = false
	incident_move = false
	incident_orient = false
	steer_move = false
	steer_orient = false
}
footprint_hero = {
	collide_footprints = true
	collide_walls = false
	shape = circle
	radius = 0.4
	hard_ratio = 0.75
	height = 1.8
	mass = 400.0
	push = 45.0
}
footprint_human = {
	collide_footprints = true
	collide_walls = true
	shape = circle
	radius = 0.3
	hard_ratio = 0.75
	height = 1.8
	mass = 300.0
	push = 45.0
}
footprint_dummy = {
	collide_footprints = true
	collide_walls = true
	shape = circle
	radius = 0.3
	hard_ratio = 0.3
	height = 1.8
	mass = 100.0
	push = 45.0
}
footprint_no_resident_collision = {
	collide_footprints = false
	collide_walls = true
	shape = circle
	radius = 0.4
	hard_ratio = 0.6
	height = 1.8
	mass = 300.0
	push = 45.0
}
footprint_rigpiece = {
	collide_footprints = false
	collide_walls = false
	shape = capsule
	radius = 1.0
	length = 2.1
	hard_ratio = 0.6
	height = 1.8
	mass = 300.0
	push = 45.0
}
footprint_skater = {
	collide_footprints = true
	collide_walls = true
	shape = circle
	radius = 0.35000002
	hard_ratio = 0.8
	height = 1.8
	mass = 300.0
	push = 45.0
}
footprint_bird = {
	collide_footprints = false
	collide_walls = false
	shape = circle
	radius = 0.3
	hard_ratio = 0.5
	height = 0.15
	mass = 0.1
	push = 45.0
}
footprint_coverstrip = {
	collide_footprints = true
	collide_walls = false
	shape = capsule
	radius = 0.6
	length = 12.5
	hard_ratio = 1.0
	height = 0.5
	mass = 800.0
	push = 400.0
}
footprint_vehicle = {
	collide_footprints = true
	collide_walls = true
	shape = capsule
	radius = 1.1
	length = 3.4
	hard_ratio = 1.0
	height = 0.8
	mass = 300.0
	push = 300.0
}
footprint_vehicle_van = {
	collide_footprints = true
	collide_walls = true
	shape = capsule
	radius = 1.0
	length = 3.0
	hard_ratio = 1.0
	height = 0.8
	mass = 300.0
	push = 300.0
}
footprint_horse = {
	collide_footprints = true
	collide_walls = true
	shape = capsule
	radius = 0.3
	length = 2.1
	hard_ratio = 1.0
	height = 0.8
	mass = 0.0
	push = 300.0
}
footprint_small_strip = {
	collide_footprints = true
	collide_walls = false
	shape = capsule
	radius = 0.3
	length = 0.1
	hard_ratio = 1.0
	height = 0.8
	mass = 0.0
	push = 100.0
}
footprint_bear = {
	collide_footprints = true
	collide_walls = true
	shape = capsule
	radius = 0.55
	length = 2.1
	hard_ratio = 1.0
	height = 0.8
	mass = 9000.0
	push = 300.0
}
footprint_wolf = {
	collide_footprints = true
	collide_walls = true
	shape = circle
	radius = 1.2
	length = 1.6
	hard_ratio = 1.0
	height = 0.8
	mass = 300.0
	push = 45.0
}
footprint_obstacle = {
	collide_footprints = true
	collide_walls = false
	shape = circle
	radius = 1.2
	hard_ratio = 0.5
	height = 0.8
	mass = 0.0
	push = 30.0
}
footprint_fire = {
	collide_footprints = true
	collide_walls = false
	shape = circle
	radius = 1.6
	hard_ratio = 0.9
	height = 1.6
	mass = 0.0
	push = 60.0
}
footprint_gameobj = {
	collide_footprints = true
	collide_walls = false
	shape = circle
	radius = 0.6
	hard_ratio = 0.1
	height = 0.8
	mass = 32.0
	push = 10.0
}
footprint_fixed_weapon = {
	collide_footprints = true
	collide_walls = false
	shape = circle
	radius = 0.8
	hard_ratio = 0.8
	height = 1.2
	mass = 0.0
	push = 300.0
}
footprint_empty = {
	collide_footprints = false
	collide_walls = false
	shape = empty
	radius = 0.1
	hard_ratio = 0.1
	height = 0.0
	mass = 0.0
	push = 0.0
}
footprint_defaultobj = {
	collide_footprints = false
	collide_walls = false
	shape = empty
	radius = 0.1
	hard_ratio = 0.1
	height = 0.0
	mass = 0.0
	push = 0.0
}
footprint_havokobj = {
	collide_footprints = false
	collide_walls = false
	shape = circle
	radius = 0.1
	hard_ratio = 0.1
	height = 0.0
	mass = 0.0
	push = 0.0
}
hero_collision_ignore_list = [
	footprint_havokobj
]
hero_no_push_me_list = [
	footprint_human
]
movement_scale_standard = (0.8, 1.2)
movement_scale_none = (1.0, 1.0)
default_lod_distance = 12.0
nav_hero = {
	$footprint_hero
	$movableprops_hero
	lod_distance = 100.0
}
nav_hero_horse = {
	$footprint_horse
	$movableprops_animal
	lod_distance = 100.0
}
nav_rigpiece = {
	$footprint_rigpiece
	$movableprops_rigpiece
}
nav_ped = {
	$footprint_human
	$movableprops_ped
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_ped_no_resident_collision = {
	$footprint_no_resident_collision
	$movableprops_ped
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_ped_no_push = {
	$footprint_human
	$movableprops_no_push
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_skateboard = {
	$footprint_empty
	$movableprops_skater
	speeds = skateboard_speeds
	speed_change_angles = skateboard_speed_change_angles
	turn_speeds = skateboard_turn_speeds
	movement_desc = default_move_skateboard
	lod_distance = $default_lod_distance
}
nav_bear = {
	$footprint_bear
	$movableprops_animal
	speeds = horse_speeds
	speed_change_angles = horse_speed_change_angles
	turn_speeds = bear_turn_speeds
	movement_desc = default_move_bear
	lod_distance = $default_lod_distance
}
nav_locked_ped = {
	$footprint_human
	$movableprops_no_push
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_fixed_weapon = {
	$footprint_fixed_weapon
	$movableprops_fixed
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_horse = {
	$footprint_horse
	$movableprops_animal
	speeds = horse_speeds
	speed_change_angles = horse_speed_change_angles
	turn_speeds = horse_turn_speeds
	movement_desc = default_move_horse
	lod_distance = $default_lod_distance
}
nav_cow = {
	$footprint_horse
	$movableprops_animal
	speeds = horse_speeds
	speed_change_angles = horse_speed_change_angles
	turn_speeds = cow_turn_speeds
	movement_desc = default_move_animal
	lod_distance = $default_lod_distance
}
nav_wolf = {
	$footprint_wolf
	$movableprops_animal
	speeds = wolf_speeds
	speed_change_angles = wolf_speed_change_angles
	turn_speeds = wolf_turn_speeds
	movement_desc = default_move_wolf
	lod_distance = $default_lod_distance
}
nav_dog = {
	$footprint_wolf
	$movableprops_animal
	speeds = wolf_speeds
	speed_change_angles = wolf_speed_change_angles
	turn_speeds = wolf_turn_speeds
	movement_desc = default_move_wolf
	lod_distance = $default_lod_distance
}
nav_bird = {
	$footprint_bird
	$movableprops_animal
	speeds = ped_speeds
	speed_change_angles = bird_speed_change_angles
	turn_speeds = bird_turn_speeds
	movement_desc = default_move_animal
	lod_distance = $default_lod_distance
}
nav_vehicle = {
	$footprint_vehicle
	$movableprops_vehicle
	speeds = vehicle_speeds
	speed_change_angles = vehicle_speed_change_angles
	turn_speeds = vehicle_turn_speeds
	movement_desc = default_move_vehicle
	lod_distance = $default_lod_distance
}
nav_vehicle_van = {
	$footprint_vehicle_van
	$movableprops_vehicle
	speeds = vehicle_speeds
	speed_change_angles = vehicle_speed_change_angles
	turn_speeds = vehicle_turn_speeds
	movement_desc = default_move_vehicle
	lod_distance = $default_lod_distance
}
nav_gameobj = {
	$footprint_gameobj
	$movableprops_obj
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_dummy = {
	$footprint_dummy
	$movableprops_no_push
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_dummy_pushable = {
	$footprint_human
	$movableprops_ped
	speeds = ped_speeds
	speed_change_angles = ped_speed_change_angles
	turn_speeds = ped_turn_speeds
	movement_desc = default_move_human
	lod_distance = $default_lod_distance
}
nav_empty = {
	$footprint_empty
	$movableprops_empty
	lod_distance = $default_lod_distance
}
nav_item = {
	$nav_empty
}
nav_defaultobj = {
	$nav_empty
}
nav_havokobj = {
	$nav_empty
	nav_collision = $havokobj_navcol
}

script ss_DisplayAStarTraversal \{traveler = terrain_anywhere}
	ss_DisplayAStar source = <source> target = <target> traveler = <traveler>
	ss_DisplayNode name = <source>
	ss_DisplayNode name = <target>
	begin
	if ss_UpdateAStar
		break
	endif
	wait \{1
		frame}
	repeat
endscript
ss_vis_line_width = 0.05
ss_vis_shape_radius = 10.0
ss_vis_shape_edge_width = 0.05
ss_vis_shape_edge_push = 0.0
ss_vis_shape_normal_push = 0.05
ss_link_property_display_type = terrain

script create_nav_label 
	setscreenelementlock id = root_window off
	if NOT gotparam rgba
		rgba = [255 255 255 255]
	endif
	if NOT gotparam shadow_rgba
		shadow_rgba = [0 0 0 128]
	endif
	if ($highdefviewer = 1)
		<this_text_scale> = 0.2
	else
		<this_text_scale> = 0.3
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		id = <id>
		parent = root_window
		type = textblockelement
		font = text_a1
		scale = <this_text_scale>
		text = <text>
		pos3d = <pos3d>
		dims = (800.0, 440.0)
		just = [left top]
		rgba = <rgba>
		shadow
		shadow_rgba = <shadow_rgba>
		shadow_offs = (1.0, 1.0)
		internal_just = [left top]
	}
endscript
