PedFleeFromPedKnockdownMinFleeSecs = 1.0
PedFleeFromPedKnockdownMaxFleeSecs = 2.0
PedFleeFromPedKnockdownMinIdleSecs = 5.0
PedFleeFromPedKnockdownMaxIdleSecs = 8.0
PedFleeFromPedBailMinFleeSecs = 1.0
PedFleeFromPedBailMaxFleeSecs = 2.0
PedFleeFromPedBailMinIdleSecs = 5.0
PedFleeFromPedBailMaxIdleSecs = 8.0
PedFleeMaxSkaterBailDist = 15.0

script RegisterBehaviors_SkateFlee 
	registerstate {
		name = Bv_FleeFromPedKnockdown
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = interest
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = child
						state = Bv_MoveAway_Loop_Location
						params = [{name = movement_desc val = {movement = run_fast strafe = true}}
							{name = finished_event_id val = Run_Away_Finished}
							{name = failed_event_id val = Run_Away_Finished}]
					}
					{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedFleeFromPedKnockdownMinFleeSecs}
							{name = max_duration_secs val = $PedFleeFromPedKnockdownMaxFleeSecs}
							{name = event_id val = Run_Away_Finished}]
					}]
			}
			{
				events = [Run_Away_Finished]
				responses = [{replacement = child
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedFleeFromPedKnockdownMinIdleSecs}
							{name = max_duration_secs val = $PedFleeFromPedKnockdownMaxIdleSecs}
							{name = event_id val = Flee_From_Ped_Knockdown_Done}]
					}
					{replacement = lookat
						state = Bv_LookAt_Location
					}]
			}]
	}
	registerstate {
		name = Bv_FleeFromSkaterBail
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = interest
						state = agent_setinterest
						params = [{name = interest_type_id val = location}
							{name = object_id val = player1}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = child
						state = Bv_MoveAway_Loop_Location
						params = [{name = movement_desc val = {movement = run_fast}}
							{name = finished_event_id val = Run_Away_Finished}
							{name = failed_event_id val = Run_Away_Finished}]
					}
					{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedFleeFromPedBailMinFleeSecs}
							{name = max_duration_secs val = $PedFleeFromPedBailMaxFleeSecs}
							{name = event_id val = Run_Away_Finished}]
					}]
			}
			{
				events = [Run_Away_Finished]
				responses = [{replacement = child
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedFleeFromPedBailMinIdleSecs}
							{name = max_duration_secs val = $PedFleeFromPedBailMaxIdleSecs}
							{name = event_id val = Flee_From_Skater_Bail_Done}]
					}
					{replacement = lookat
						state = Bv_LookAt_Location
					}]
			}]
	}
endscript
