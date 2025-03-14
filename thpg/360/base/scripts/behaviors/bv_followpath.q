
script RegisterBehaviors_FollowPath 
	finished_event_id = FollowPath_Finished
	path_segment_move = {
		id = path_segment_move
		stop_distance = 0.0
		stopping_distance = 0.0
		starting_distance = 0.0
	}
	arrival_move = {
		id = arrival_move
		stop_distance = 0.3
		arrival_distance = 0.5
		stopping_distance = 1
		starting_distance = 1
	}
	registerstate {
		name = Bv_FollowPath
		task = {name = Task_FollowPath
			params = {finished_event_id = <finished_event_id>
				movement_desc = <path_segment_move>
				arrival_movement_desc = <arrival_move>
			}}
	}
	registerstate {
		name = Bv_ManagedFollowPath
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_FollowPath
						params = [{name = finished_event_id ref = finished_event_id}
							{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = arrival_movement_desc ref = arrival_movement_desc}]}
					{replacement = detect
						state = Bv_DetectAndAcquireVehicles}
					{replacement = equip
						state = Bv_EnableItemControlEquip}
					{replacement = reload
						state = Bv_EnableItemControlReload}
				]}
		]
	}
	registerstate {
		name = Bv_FollowPathAndStopInDirection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_FollowPath
						params = [{name = finished_event_id val = FPASID_Finished}
							{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = arrival_movement_desc ref = arrival_movement_desc}]}
				]
			}
			{events = [FPASID_Finished]
				responses = [{replacement = child
						state = Bv_StopInDirection
						params = [{name = node ref = end_waypoint}
							{name = direction ref = direction}]
					}
					{replacement = child2
						state = eventcache_add
						params = [{name = event_id val = FollowPath_Finished}]
					}
				]
			}
		]
	}
endscript

script Bv_RubberBandPath critical_arrival_distance = 10 ahead_min_dist = 30 ahead_max_dist = 75 behind_min_dist = 2.5 behind_max_dist = 25 object = hero default_speed = 0.75 max_speed = 2 min_speed = 0.1
	if NodeExists <waypoint>
		getnode <waypoint>
		if structurecontains structure = <waypoint> action
			ai_giveorder name = Bv_FollowPathNodes params = {start_node_id = <waypoint> <...>}
		else
			ai_giveorder name = Bv_FollowPath params = {<...>}
		endif
	else
		softassert "node %n doesnt exist" n = <waypoint>
		return
	endif
	if NOT gotparam critical_waypoints
		softassert "need 'critical_waypoints' array"
		return
	endif
	obj_getid
	<index> = 0
	getarraysize critical_waypoints
	begin
	<current_waypoint> = (<critical_waypoints> [<index>])
	getnode <current_waypoint>
	<current_waypoint_pos> = (<node>.pos)
	getdistance objecta = <object> objectb = <objid>
	<me_to_object_dist> = <dist_atob>
	getdistance objecta = <object> posb = <current_waypoint_pos>
	<node_to_object_distance> = <dist_atob>
	getdistance objecta = <objid> posb = <current_waypoint_pos>
	<node_to_me_distance> = <dist_atob>
	GetRubberBandSpeed {my_dist = <node_to_me_distance>
		object_dist = <node_to_object_distance>
		me_to_object_dist = <me_to_object_dist>
		ahead_max_dist = <ahead_max_dist>
		ahead_min_dist = <ahead_min_dist>
		behind_max_dist = <behind_max_dist>
		behind_min_dist = <behind_min_dist>
		default_speed = <default_speed>
		max_speed = <max_speed>
		min_speed = <min_speed>
	}
	if (<rubber_band_speed> > 0.875)
		movement_desc = {point_arrival_distance = 2.5
			arrival_distance = 10
			speed = <rubber_band_speed>
			turn_speeds = $horse_turn_speeds
			speed_change_angles = horse_speed_change_angles}
	else
		movement_desc = {point_arrival_distance = 2.5
			arrival_distance = 2.5
			speed = <rubber_band_speed>
			turn_speeds = $ped_turn_speeds
			speed_change_angles = ped_speed_change_angles}
	endif
	Navigation_SetMovementDesc movement_desc = <movement_desc>
	if (<node_to_object_distance> < <critical_arrival_distance>)
		<index> = (<index> + 1)
	else
		if (<node_to_me_distance> < <critical_arrival_distance>)
			<index> = (<index> + 1)
		endif
	endif
	if (<index> = <array_size>)
		break
	endif
	wait 2 frames
	repeat
endscript
