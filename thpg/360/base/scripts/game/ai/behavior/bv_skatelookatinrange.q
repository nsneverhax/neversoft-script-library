GoalPedLookAtPlayerRadius = 15.0

script RegisterBehaviors_SkateLookAtInRange 
	registerstate {
		name = Bv_LookAtInRangeDetect
		transitions = [{events = [enter_behavior]
				responses = [{replacement = interest
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = dist
						state = Bv_GenEvents_Distance
						params = [{name = distance val = $GoalPedLookAtPlayerRadius}
							{name = greater_than val = Look_At_In_Range_Done}
							{name = less_than val = Start_Look_At_In_Range}
							{name = interest_type_id val = location}]
					}]
			}]
	}
	registerstate {
		name = Bv_LookAtInRange
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = interest
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = lookat
						state = Bv_LookAt_Location
					}]
			}]
	}
endscript
