
script RegisterBehaviors_PedLife 
	registerstate {
		name = Bv_PedLife_Respond
		task =
		{
			name = Task_Respond
			params = {success_event_id = Respond_Success
				failed_event_id = Respond_Failed}
		}
		transitions = [{events = [Respond_Success]
				responses = [{replacement = child
						state = Bv_Pedlife_Sequence
						params = [{name = behaviors ref = behaviors}
							{name = sequence_completion_event ref = sequence_completion_event}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Life
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PedLife}]
			}]
	}
	registerstate {
		name = Bv_PedLife
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect state = Bv_Pedlife_DetectNearby}
					{replacement = child state = Bv_PedLife_Choose_Behavior}]
			}
			{events = [nearby_pedlife_detected]
				recur = true ,
				responses = [{replacement = child
						state = Bv_PedLife_Respond
						params = [{name = target ref = target}
							{name = behaviors ref = behaviors}
							{name = enforce_coop ref = enforce_coop}
							{name = sequence_completion_event val = pedlife_sequence_finished}]
					}]
			}
			{events = [pedlife_sequence_finished
					pedlife_reaction_finished
					nearby_pedlife_lost
					Respond_Failed]
				recur = true ,
				responses = [{replacement = child
						state = Bv_PedLife_Choose_Behavior
						params = [{name = sequence_completion_event val = pedlife_sequence_finished}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_PedLife_Horse
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect state = Bv_Pedlife_DetectNearby}
					{replacement = child state = Bv_PedLife_Choose_Behavior}
					{replacement = threat state = Bv_ThreatReaction_Horse}]
			}
			{events = [nearby_pedlife_detected]
				responses = [{replacement = child state = Bv_PedLife_Respond
						params = [{name = target ref = target}
							{name = behaviors ref = behaviors}
							{name = enforce_coop ref = enforce_coop}
							{name = sequence_completion_event val = pedlife_sequence_finished}]
					}]
			}
			{events = [pedlife_sequence_finished
					pedlife_reaction_finished
					nearby_pedlife_lost
					Respond_Failed]
				recur = true ,
				responses = [{replacement = child state = Bv_PedLife_Choose_Behavior}]
			}
		]
	}
	registerstate {
		name = Bv_PedLife_Elk
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect state = Bv_Pedlife_DetectNearby}
					{replacement = child state = Bv_PedLife_Choose_Behavior}
					{replacement = threat state = Bv_ThreatReaction_Elk}]
			}
			{events = [nearby_pedlife_detected]
				responses = [{replacement = child state = Bv_PedLife_Respond
						params = [{name = target ref = target}
							{name = behaviors ref = behaviors}
							{name = enforce_coop ref = enforce_coop}
							{name = sequence_completion_event val = pedlife_sequence_finished}]
					}]
			}
			{events = [pedlife_sequence_finished
					pedlife_reaction_finished
					nearby_pedlife_lost
					Respond_Failed]
				recur = true ,
				responses = [{replacement = child state = Bv_PedLife_Choose_Behavior}]
			}
		]
	}
	registerstate {
		name = Bv_PedLife_Choose_Behavior
		task = {name = Task_PedLife}
		transitions = [{
				events = [pedlife_sequence]
				responses = [{replacement = this
						state = Bv_Pedlife_Sequence
						params = [{name = behaviors ref = behaviors}
							{name = sequence_completion_event ref = sequence_completion_event}]
					}]
			}]
	}
	registerstate {
		name = Bv_Pedlife_Sequence
		task = {name = Task_Sequence
			params = {
			}}
	}
	registerstate {
		name = Bv_PedLife_SetState
		task = {name = Task_PedLife_SetState
			params = {}}
	}
	registerstate {
		name = Bv_Pedlife_SetArea
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this
						state = agent_setareas
						params = [{name = life_area ref = area}]
					}]
			}]
	}
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Aggressive combat_behavior = bv_balancedcombat_prefer
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Aggressive_Bound combat_behavior = Bv_BalancedCombat_Guard
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Wolf combat_behavior = Bv_Combat_Wolf
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Coyote combat_behavior = Bv_Combat_Coyote
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Elk combat_behavior = Bv_MoveAway_Loop_Enemy
	Behavior_RegisterExitLife behavior_id = Bv_ExitLife_Passive combat_behavior = Bv_Pedlife_Flee
	registerstate {
		name = Bv_SetExitSequence
		transitions = [{events = [enter_behavior]
				responses = [{replacement = disable
						state = Bv_EnableHierarchy
						params = [{name = hierarchy val = reaction}
							{name = no_name val = off}]
					}
					{replacement = this
						state = Bv_Scr_SetExitSequence
						params = [{name = sequence_id ref = sequence_id}]
					}]
			}]
	}
	registerstate {
		name = Bv_ClearExitSequence
		transitions = [{events = [enter_behavior]
				responses = [{replacement = disable
						state = Bv_EnableHierarchy
						params = [{name = hierarchy val = reaction}
							{name = no_name val = on}]
					}
					{replacement = this
						state = agent_clearexitsequence
					}]
			}]
	}
	registerstate {
		name = Bv_PedLife_VO_Idle
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 30
				max_duration_secs = 45
				event_id = PedLife_VO_Idle_Play}}
		transitions = [{events = [PedLife_VO_Idle_Play]
				responses = [{replacement = this state = Bv_PedLife_VO_Idle_Play}]
			}]
	}
	registerstate {
		name = Bv_PedLife_VO_Idle_Play
		task = {name = task_runscript
			params = {script_name = playvoiceoverbyevent
				script_params = {event_id = idle}
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this state = Bv_PedLife_VO_Idle}]
			}]
	}
	registerstate {
		name = Bv_PedLife_Idle
		task = {name = Task_GenEvents_Timer
			params = {
				event_id = PedLife_Idle_Finished}}
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = stand state = bv_stand}
					{replacement = vo state = Bv_PedLife_VO_Idle}]
			}]
	}
	registerstate {
		name = Bv_PedLife_Roam_Loop
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_ReleaseVehicle}]
			}
			{events = [ReleaseVehicle_Finished
					ReleaseVehicle_Failed
					pedlife_roam_finished]
				recur = true ,
				responses = [{replacement = child state = Bv_PedLife_Roam_Move
						params = [{name = no_name ref = all_params}]}]
			}]
	}
	registerstate {
		name = Bv_PedLife_Roam
		transitions = [{events = [enter_behavior]
				responses = [{replacement = stand state = Bv_ReleaseVehicle}]
			}
			{events = [ReleaseVehicle_Finished
					ReleaseVehicle_Failed]
				responses = [{replacement = this state = Bv_PedLife_Roam_Move
						params = [{name = no_name ref = all_params}]}]
			}]
	}
	registerstate {
		name = Bv_PedLife_Roam_Move
		task = {name = Task_PedLife_Roam
			params = {movement_desc_id = {movement = walk_slow arrival_distance = 1.0}
			}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = stand state = bv_stand}
					{replacement = vo state = Bv_PedLife_VO_Idle}]
			}]
	}
	registerstate {
		name = Bv_Pedlife_DetectNearby
		task = {name = Task_DetectNearbyPedlife
			params = {set_interest_distance = 8.75
				clear_interest_distance = 12.5}}
	}
	registerstate {
		name = Bv_Pedlife_FindPed
		task = {name = Task_PedlifeFindPed
			params = {
			}}
	}
	registerstate {
		name = Bv_Pedlife_ReactionFinished
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this
						state = Bv_AddEvent
						params = [{name = event_id val = pedlife_reaction_finished}]
					}]
			}]
	}
	registerstate {
		name = Bv_PedLife_PlayAnim
		task = {name = Task_PedLife_PlayAnim
			params = {
			}}
	}
	registerstate {
		name = Bv_Pedlife_Combat
		task = {name = task_runscript
			params = {script_name = agent_setinterestmaxdesireddist
				script_params = {interest_type_id = enemy max_dist = 62.5}}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this
						state = Bv_Pedlife_SetCombat}]
			}]
	}
	registerstate {
		name = Bv_Pedlife_SetCombat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id val = bv_balancedcombat_prefer}
						]
					}
					{replacement = life
						state = bv_runlife
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Pedlife_Flee
		transitions = [{events = [enter_behavior]
				responses = [{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id val = Bv_MoveAwayToMaxDist_Loop_Enemy}
							{name = behavior_life_params val = {movement_desc = ped_urgent_point_move}}]
					}
					{replacement = life
						state = bv_runlife
					}]
			}]
	}
	pedlife_follow_move_desc = {movement = walk_fast
		stop_distance = 2
		departure_distance = 2.75
		stopping_distance = 5}
	registerstate {
		name = Bv_PedLife_Follow
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 15
				max_duration_secs = 80
				event_id = PedLife_Follow_Finished}}
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				movement_desc = <pedlife_follow_move_desc>
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = look state = Bv_LookAt_Interact}
					{replacement = vo state = Bv_PedLife_VO_Idle}]
			}]
	}
	pedlife_follow_side_desc = {movement = run_slow
		stop_distance = 0.25
		arrival_distance = 0.375
		departure_distance = 0.875
		stopping_distance = 5
		starting_distance = 5}
	registerstate {
		name = Bv_PedLife_Follow_Side
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 15
				max_duration_secs = 80
				event_id = PedLife_Follow_Side_Finished}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move state = Bv_PedLife_Follow_Side_Left weight = 1}
					{replacement = move state = Bv_PedLife_Follow_Side_Right weight = 1}
					{replacement = look state = Bv_LookAt_Interact}
					{replacement = vo state = Bv_PedLife_VO_Idle}]
			}]
	}
	registerstate {
		name = Bv_PedLife_Follow_Side_Left
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				offset_movement_desc = <pedlife_follow_side_desc>
				relative_offset_type = movement
				relative_offset = (1.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
	}
	registerstate {
		name = Bv_PedLife_Follow_Side_Right
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				offset_movement_desc = <pedlife_follow_side_desc>
				relative_offset_type = movement
				relative_offset = (-1.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
	}
	registerstate {
		name = Bv_PedLife_Avoid
		transitions = [{events = [enter_behavior]
				responses =
				[
					{
						replacement = move
						state = Bv_MoveAway_Loop_Interact
						params = [{name = movement_desc val = {movement = walk_slow
									stop_distance = 2
									departure_distance = 2.75
									starting_distance = 5}}]
					}
					{replacement = vo state = Bv_PedLife_VO_Idle}
				]
			}]
	}
	chat_duration = 6.0
	registerstate {
		name = Bv_PedLife_Chat_Talk
		task =
		{name = Task_GenEvents_Timer
			params = {min_duration_secs = <chat_duration>
				max_duration_secs = <chat_duration>
				event_id = PedLife_Chat_Finished
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = anims state = Bv_PlayTalkAnims}
					{replacement = look state = Bv_LookAt_Interact}
					{replacement = dist state = Bv_GenEvents_Distance
						params =
						[
							{name = greater_than val = PedLife_Chat_Finished}
							{name = distance val = 3.75}
							{name = interest_type_id val = interact}
						]
					}
					{replacement = voice state = playvoiceoverbyevent
						params = [{name = event_id val = chat}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_PedLife_Chat_Listen
		task =
		{name = Task_GenEvents_Timer
			params = {min_duration_secs = <chat_duration>
				max_duration_secs = <chat_duration>
				event_id = PedLife_Chat_Finished
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = look state = Bv_LookAt_Interact}
					{replacement = dist state = Bv_GenEvents_Distance
						params =
						[
							{name = greater_than val = PedLife_Chat_Finished}
							{name = distance val = 3.75}
							{name = interest_type_id val = interact}
						]
					}
				]
			}
		]
	}
endscript

script Behavior_RegisterExitLife 
	registerstate {
		name = <behavior_id>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_Scr_GetExitSequence
					}]
			}
			{events = [Exit_Life]
				responses = [{replacement = child
						state = Bv_Pedlife_Sequence
						params = [{name = behaviors ref = exit_sequence}
							{name = sequence_completion_event val = Exit_Life_Finished}]
					}]
			}
			{events = [Exit_Life_Finished]
				responses = [{replacement = child
						state = Bv_ClearExitSequence
					}
					{replacement = this
						state = <combat_behavior>
					}]
			}]
	}
endscript

script Bv_Scr_SetExitSequence 
	agent_setexitsequence sequence = <sequence_id>
endscript

script Bv_Scr_GetExitSequence 
	if agent_getexitsequence
		eventcache_add event_id = Exit_Life event_data = {exit_sequence = <exit_sequence>}
	else
		eventcache_add \{event_id = Exit_Life_Finished}
	endif
endscript
