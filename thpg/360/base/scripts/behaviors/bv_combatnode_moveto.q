
script RegisterBehaviors_CombatNode_MoveTo 
	combat_node_movement_desc = {
		id = combat_node_movement_desc
		movement = run_fast
		stop_distance = 0.25
		arrival_distance = 1.5
		departure_distance = 2.5
		point_arrival_distance = 0.75
		stopping_distance = 0.25
		starting_distance = 0.25
		outside_boundary = arrive
		path_find = shortest
		strafe = true
		speeds = $ped_speeds
		turn_speeds = $ped_turn_speeds
		speed_change_angles = ped_speed_change_angles
		lin_accel = $default_lin_accel
		rot_accel = default_rot_accel
	}
	registerstate {
		name = Bv_CombatNode_MoveTo
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				movement_desc = <combat_node_movement_desc>
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
			}
		}
	}
	registerstate {
		name = Bv_CombatNode_StandMoveTo
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				movement_desc = <combat_node_movement_desc>
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = stand state = bv_stand}]}
		]
	}
endscript
