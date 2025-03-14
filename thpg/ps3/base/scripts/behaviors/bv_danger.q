Task_ProcessEscapeDangerEvent = {
	enter = ProcessEscapeDangerEvent
}

script ProcessEscapeDangerEvent 
	if compositeobjectexists name = (<task_params>.subject)
		<location> = (<task_params>.subject)
		agent_setareas {location = <location>}
	endif
endscript

script RegisterBehaviors_Danger 
	registerstate {
		name = Bv_DetectTrampleDanger
		task = {name = Task_DetectTrampleDanger
			params = {full_danger_event_id = Full_Trample_Danger
				potential_danger_event_id = Potential_Trample_Danger
			}
		}
		transitions = []}
	registerstate {
		name = Bv_EscapeFullTrample_CombatMove
		transitions = [{events = [enter_behavior]
				responses = [{replacement = aim state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = Bv_EscapeFullTrample_Move}]
			}
		]
	}
	registerstate {
		name = Bv_EscapeFullTrample_Move
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MoveAwayToMaxDist_Loop_Location
						params = [{name = movement_desc val = $ped_urgent_point_move}
							{name = max_distance val = 10}
							{name = finished_event_id val = escape_danger_finished}]
					}
					{replacement = timer
						state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 2.0}
							{name = max_duration_secs val = 3.0}
							{name = event_id val = escape_danger_finished}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_EscapeWagon_Move
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MoveAwayToMaxDist_Loop_Location
						params = [{name = movement_desc val = {movement = run_fast mode = stand}}
							{name = max_distance val = 1800}
							{name = finished_event_id val = escape_danger_finished}]
					}
					{replacement = timer
						state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 4.0}
							{name = max_duration_secs val = 6.0}
							{name = event_id val = escape_danger_finished}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_EscapeFullTrample_CombatDodge
		transitions = [{events = [enter_behavior]
				responses = [{replacement = aim state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = Bv_EscapeFullTrample_Dodge}]
			}
		]
	}
	registerstate {
		name = Bv_DodgeByReactionState_Dodge
		task = {name = Task_DodgeByReactionState
			params = {
				reaction_state_anims = $SkatePed_DodgeAnims
				finished_event_id = EscapeTrample_Dodge_Finished
				anim_tree = $Agent_AnimBranch_Reaction}}
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = move_stop
						state = Bv_StopInstant
					}
					{replacement = interact
						state = interact_clearcurnode
					}
					{replacement = vo
						state = playvoiceoverbyevent
						params = [{name = event_id val = avoid}]
					}]
			}]
	}
	registerstate {
		name = Bv_DodgeByReactionState
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{conditions = [{name = agent_comparedodgedirection
						params = {dir = left anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Dodge_Trample}
							{name = event_data val = {dodge_direction = left}}
						]
					}]
			}
			{conditions = [{name = agent_comparedodgedirection
						params = {dir = right anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Dodge_Trample}
							{name = event_data val = {dodge_direction = right}}
						]
					}]
			}
			{conditions = [{name = agent_comparedodgedirection
						params = {dir = front anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Dodge_Trample}
							{name = event_data val = {dodge_direction = front}}
						]
					}]
			}
			{conditions = [{name = agent_comparedodgedirection
						params = {dir = back anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Dodge_Trample}
							{name = event_data val = {dodge_direction = back}}
						]
					}]
			}
			{conditions = [{name = agent_comparedodgedirection
						params = {dir = run anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Run_From_Trample}
						]
					}]
			}
			{conditions = [{name = agent_comparedodgedirection
						params = {dir = failed anim_struct = $SkatePed_DodgeAnims interest_type_id = location}
					}]
				responses = [{replacement = this
						state = eventcache_add
						params =
						[
							{name = event_id val = Escape_Danger_Failed}
						]
					}]
			}]
	}
	registerstate {
		name = Bv_EscapeFullTrample_Dodge_Dodge
		task = {name = Task_Dodge
			params = {
				anim_stage = custom
				finished_event_id = EscapeTrample_Dodge_Finished}}
		transitions = []}
	registerstate {
		name = Bv_EscapePotentialTrample_CombatMove
		transitions = [{events = [enter_behavior]
				responses = [{replacement = aim state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = Bv_EscapePotentialTrample_Move}
				]
			}
		]
	}
	registerstate {
		name = Bv_EscapePotentialTrample_Move
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_MoveAwayToMaxDist_Loop_Location
						params = [{name = movement_desc val = {movement = walk_fast}}
							{name = max_distance val = 10}
							{name = finished_event_id val = escape_danger_finished}]
					}
					{replacement = timer
						state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 4.0}
							{name = max_duration_secs val = 6.0}
							{name = event_id val = escape_danger_finished}]
					}
				]
			}
		]
	}
endscript
