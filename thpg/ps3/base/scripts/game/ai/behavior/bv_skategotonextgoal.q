StartGoToNextGoalPlayerDist = 10.0
AbortGoToNextGoalPlayerDist = 30.0

script RegisterBehaviors_SkateGoToNextGoal 
	registerstate {
		name = Bv_GoToNextGoal
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = global
						state = GoToNextGoal_Global
					}
					{
						replacement = state
						state = Bv_GoToNextGoal_InitialWait
					}]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = suspend_disable
						state = obj_suspendenable
						params = [{name = on val = 1}]
					}]
			}]
	}
	registerstate {
		name = Bv_GoToNextGoal_InitialWait
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GoToNextGoal_InitialWait
					}]
			}
			{events = [Player_Close]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_MoveToGoal
					}]
			}]
	}
	registerstate {
		name = Bv_GoToNextGoal_MoveToGoal
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GoToNextGoal_MoveToGoal
					}]
			}
			{events = [bumped_knockdown]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_RecoverFromKnockdown
					}]
			}
		]
	}
	registerstate {
		name = Bv_GoToNextGoal_RecoverFromKnockdown
		transitions = [{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_GetOnSkateboard
					}]
			}]
	}
	registerstate {
		name = Bv_GoToNextGoal_GetOnSkateboard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GoToNextGoal_GetOnSkateboard
					}]
			}
			{events = [Go_To_Next_Goal]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_MoveToGoal
					}]
			}
			{events = [Go_To_Prev_Goal]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_ReturnToStart
					}]
			}]
	}
	registerstate {
		name = Bv_GoToNextGoal_ReturnToStart
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GoToNextGoal_ReturnToStart
					}]
			}
			{events = [Arrived_At_Start]
				responses = [{replacement = this
						state = Bv_GoToNextGoal_InitialWait
					}]
			}]
	}
endscript

script GoToNextGoal_Global 
	obj_suspendenable \{on = 0}
	agent_setinterest \{interest_type_id = enemy
		object_id = player1
		acquire_vis_loc = true}
	settags \{NextGoalInstructionVoPlayed = false}
	settags \{IsGoingToNextGoal = true}
endscript

script GoToNextGoal_InitialWait 
	settags \{IsGoingToNextGoal = true}
	ai_giveorder \{replacement = get_on_skateboard
		name = Bv_EnterItemVehicle}
	blockuntilevent \{anytypes = [
			AcquireVehicle_Finished
			AcquireVehicle_Failed
		]}
	ai_giveorder \{replacement = dist_player
		name = Bv_GenEvents_Distance
		params = {
			distance = $StartGoToNextGoalPlayerDist
			greater_than = Null_Event
			less_than = Player_Close
			interest_type_id = enemy
		}}
endscript

script GoToNextGoal_MoveToGoal 
	eventcache_add \{event_id = Go_To_Next_Goal_Done}
endscript

script GoToNextGoal_GetOnSkateboard 
	getsingletag \{IsGoingToNextGoal}
	ai_giveorder \{replacement = child
		name = Bv_EnterItemVehicle}
	blockuntilevent \{anytypes = [
			AcquireVehicle_Finished
			AcquireVehicle_Failed
		]}
	if (<IsGoingToNextGoal> = true)
		eventcache_add \{event_id = Go_To_Next_Goal}
	else
		eventcache_add \{event_id = Go_To_Prev_Goal}
	endif
endscript

script GoToNextGoal_ReturnToStart 
	settags \{IsGoingToNextGoal = false}
	getsingletag \{prev_travel_to_node}
	ai_giveorder replacement = move name = Bv_MoveTo params = {waypoint = <prev_travel_to_node> finished_event_id = Arrived_At_Start}
endscript
