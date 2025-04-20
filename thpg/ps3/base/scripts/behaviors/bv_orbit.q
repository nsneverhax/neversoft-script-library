Orbit_Center_Max_Distance = 10
Orbit_Target_Max_Distance = 7.5
Orbit_Default_Side_Motion = 0.2
Orbit_DefaultDistanceMin = 10
Orbit_DefaultDistanceMax = 20
Orbit_MoveTo_Movement = {
	id = ped__orbit_moveto_move
	movement = run_slow
	stop_distance = Orbit_DefaultDistanceMin
	arrival_distance = Orbit_DefaultDistanceMin
	departure_distance = 2
	point_arrival_distance = 0.5
	stopping_distance = 0.75
	starting_distance = 0.25
}
Orbit_BackOff_Movement = {
	id = ped_orbit_backoff_move
	movement = run_slow
	stop_distance = 1.75
	arrival_distance = 4
	departure_distance = 2
	point_arrival_distance = 0.5
	stopping_distance = 0.75
	starting_distance = 0.25
}

script RegisterBehaviors_Orbit 
	registerstate {
		name = Bv_Orbit_Loop_Location
		transitions = [{events = [enter_behavior]
				responses = [{replacement = watch_too_close
						state = Bv_GenEvents_Distance
						params = [{name = less_than val = Orbit_TooClose}
							{name = greater_than val = Orbit_TooClose_Unused}
							{name = distance ref = min_distance}
							{name = distance val = Orbit_DefaultDistanceMin}
							{name = interest_type_id val = location}]
					}
					{replacement = watch_too_far
						state = Bv_GenEvents_Distance
						params = [{name = less_than val = Orbit_TooFar_Unused}
							{name = greater_than val = Orbit_TooFar}
							{name = distance ref = max_distance}
							{name = distance val = Orbit_DefaultDistanceMax}
							{name = interest_type_id val = location}]
					}
				]
			}
			{events = [Orbit_TooFar]
				responses = [{replacement = move
						state = bv_moveto_loop_location
					}
					{replacement = watch_too_far
						state = bv_blank
					}
				]
			}
			{events = [Orbit_TooClose]
				responses = [{replacement = move
						state = Bv_MoveAwayThenEscape_Location
					}
					{replacement = watch_too_close
						state = bv_blank
					}
				]
			}
		]
	}
endscript
