
script RegisterBehaviors_Wander 
	registerstate \{name = Bv_Wander
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = move
						state = Bv_Wander_Move
						params = [
							{
								name = path_stage
								ref = path_stage
							}
						]
					}
					{
						replacement = look
						state = Bv_Wander_Look
					}
				]
			}
		]}
endscript

script RegisterBehaviors_Wander_Move 
	registerstate {
		name = Bv_Wander_Move
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Wander_Move_RandMove
						params = [{name = path_stage ref = path_stage}]}
					{replacement = timer state = Bv_Wander_Move_Timer}]}
			{events = [Wander_Move_TimedOut
					Wander_Move_RandMove_Finished] ,
				recur = true ,
				responses = [{replacement = child
						state = Bv_Wander_Move_RandMove weight = 4
						params = [{name = path_stage ref = path_stage}]
					}
					{replacement = child state = bv_blank weight = 1}
					{replacement = timer state = Bv_Wander_Move_Timer}]}
		]}
	registerstate {
		name = Bv_Wander_Move_RandMove
		task = {name = Task_MoveToRandPos
			params = {min_dist = 12.5
				max_dist = 25
				finished_event_id = Wander_Move_RandMove_Finished
				movement_desc = {stopping_distance = 1.875
					arrival_distance = 2.5
					stop_distance = 0.625
					movement = walk_slow
					mode = stand}
			}}
		transitions = []}
	registerstate {
		name = Bv_Wander_Move_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 5
				max_duration_secs = 10
				event_id = Wander_Move_TimedOut}}
		transitions = []}
endscript

script RegisterBehaviors_Wander_Look 
	registerstate {name = Bv_Wander_Look
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_Wander_Look_RandLook}
					{replacement = timer state = Bv_Wander_Look_Timer}]}
			{events = [Wander_Look_TimedOut] ,
				responses = [{replacement = child state = Bv_Wander_Look_RandLook}
					{replacement = timer state = Bv_Wander_Look_Timer}]}
		]}
	registerstate {name = Bv_Wander_Look_RandLook
		task = {name = Task_LookInRandDir
			params = {max_hor_degree_offset = 30
				max_vert_degree_offset = 15}}
		transitions = []}
	registerstate {name = Bv_Wander_Look_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 3
				event_id = Wander_Look_TimedOut}}
		transitions = []}
endscript
