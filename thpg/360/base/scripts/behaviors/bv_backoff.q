BackOff_Center_Max_Distance = 125
BackOff_Target_Max_Distance = 7.5
BackOff_Default_Side_Motion = 0.2
BackOff_Movement = {
	id = ped_backoff_move
	movement = run_slow
	stop_distance = 1.75
	arrival_distance = 4
	departure_distance = 2
	point_arrival_distance = 0.5
	stopping_distance = 0.75
	starting_distance = 0.25
}

script RegisterBehaviors_BackOff 
	registerstate {
		name = Bv_BackOff_Once
		task = {name = Task_BackOff
			params = {target_interest_type_id = enemy
				center_interest_type_id = center
				center_max_distance = BackOff_Center_Max_Distance
				target_max_distance = BackOff_Target_Max_Distance
				side_motion_ratio = BackOff_Default_Side_Motion
				movement_desc_id = ped_backoff_move}}
		transitions = []}
	registerstate {
		name = Bv_BackOff_Loop
		task = {name = Task_GenEvents_Distance
			params = {less_than = BackOff_LessThan
				greater_than = unused
				distance = BackOff_Target_Max_Distance
				interest_type_id = enemy}}
		transitions = [{events = [enter_behavior , backoff_arrived , backoff_failed , BackOff_LessThan] ,
				recur = true ,
				responses = [{replacement = child
						state = Bv_BackOff_Once
						params = [{name = target_interest_type_id ref = interest_type_id}
							{name = target_max_distance ref = distance}
							{name = center_interest_type_id ref = center_interest_type_id}
							{name = center_max_distance ref = center_max_distance}
							{name = target_max_distance ref = target_max_distance}
							{name = side_motion_ratio ref = side_motion_ratio}
							{name = side_motion_ratio val = 0.2}]
					}]}
		]}
endscript
