
script RegisterBehaviors_PlayAnim 
	registerstate {
		name = Bv_PlayAnim
		task = {name = Task_PlayAnim}
	}
	registerstate {
		name = Bv_PlayAnimSet
		task = {name = Task_PlayAnimSet}
	}
	registerstate {
		name = Bv_Agent_PlayCustomAnim
		task = {name = Task_Agent_PlayCustomAnim}
	}
	registerstate {
		name = Bv_PlayAnim_Timer
		task = {name = Task_PlayAnim}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs ref = min_duration_secs}
							{name = max_duration_secs ref = max_duration_secs}
							{name = event_id val = playanim_timer_finished}]
					}
				]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = child
						state = Bv_AddEvent
						params = [{name = event_id val = CustomAnimation_Finished}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_LockedPlayAnim_Timer
		task = {name = Task_PlayAnim
			params = {lock_movement}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs ref = min_duration_secs}
							{name = max_duration_secs ref = max_duration_secs}
							{name = event_id val = playanim_timer_finished}]
					}
				]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = child
						state = Bv_AddEvent
						params = [{name = event_id val = CustomAnimation_Finished}]
					}
				]
			}
		]
	}
endscript
