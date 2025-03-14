
script RegisterBehaviors_SkateWatchPlayerInGoal 
	registerstate \{name = Bv_WatchPlayerInGoal
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = move_stop
						state = Bv_Stop
					}
					{
						replacement = interest_location_player
						state = Bv_AimAt_Location
						params = [
							{
								name = interest_type_id
								val = location
							}
							{
								name = object_id
								val = player1
							}
							{
								name = acquire_vis_loc
								val = false
							}
						]
					}
					{
						replacement = aimat_location_player
						state = Bv_AimAt_Location
					}
				]
			}
		]}
endscript
