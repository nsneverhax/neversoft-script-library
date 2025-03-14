
script RegisterBehaviors_MoveStraight 
	default_fail_distance = 11.25
	default_max_distance = 22.5
	registerstate {
		name = Bv_MoveStraight_Once
		task = {name = Task_MoveStraight
			params = {finished_event_id = MoveStraight_Finished
				failed_event_id = MoveStraight_Failed
				fail_distance = <default_fail_distance>
				max_distance = <default_max_distance>
			}}
		transitions = []
	}
	registerstate {
		name = Bv_MoveStraight_Loop
		transitions = [{events = [enter_behavior MoveStraight_Finished] ,
				recur = true ,
				responses = [{replacement = child
						state = Bv_MoveStraight_Once
						params = [{name = movement_desc ref = movement_desc}]
					}]
			}]
	}
endscript
