
script RegisterBehaviors_InteractNode 
	registerstate {
		name = Bv_RunInteraction
		task = {name = Task_RunInteraction}
	}
	<slide_to_node_speed> = 0.5
	registerstate {
		name = Bv_InteractNode_MoveTo
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_moveto_once_interact
						params = [{name = no_name ref = all_params}
							{name = finished_event_id val = Move_Finished}]
					}]
			}
			{events = [Move_Finished]
				responses = [{replacement = child
						state = bv_blank}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = child state = bv_stand}
					{replacement = finished state = interact_clearcurnode}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_FollowPath
		transitions = [{events = [enter_behavior]
				conditions = [{name = interact_curnodehaslinks result = true}]
				responses = [{replacement = child
						state = bv_moveto_once_interact
						params = [{name = no_name ref = all_params}
							{name = path_segment val = true}
							{name = finished_event_id val = Interact_Path_Segment_Finished}
							{name = movement_desc val = {stop_distance = 0.0
									stopping_distance = 0.0
									starting_distance = 0.0}}
							{name = offset_movement_desc val = {stop_distance = 0.0
									stopping_distance = 0.0
									starting_distance = 0.0}}]
					}]
			}
			{events = [enter_behavior]
				conditions = [{name = interact_curnodehaslinks result = false}]
				responses = [{replacement = child
						state = bv_moveto_once_interact
						params = [{name = no_name ref = all_params}
							{name = finished_event_id val = Interact_Path_Finished}]
					}]
			}
			{events = [Interact_Path_Segment_Finished]
				responses = [{replacement = child
						state = interact_finishcurnode}]
			}
			{events = [Interact_Path_Finished]
				responses = [{replacement = child
						state = bv_blank}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child state = bv_stand}
					{replacement = finished state = interact_clearcurnode}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = finished
						state = interact_finishcurnode}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_UseIntersection
		task = {name = Task_UseIntersection
			params = {no_name = all_params
				arrived_event_id = Move_To_Intersection_Done
				finished_event_id = Use_Intersection_Done}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_moveto_once_interact
						params = [{name = no_name ref = all_params}
							{name = path_segment val = true}
							{name = finished_event_id val = Move_To_Intersection_Done}]
					}]
			}
			{events = [Use_Intersection_Done]
				responses = [{replacement = child
						state = interact_finishcurnode}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = interact_clearcurnode}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = finished
						state = interact_finishcurnode}]
			}]
	}
	registerstate {
		name = Bv_EnterCrosswalk
		task = {name = Task_UseIntersection
			params = {no_name = all_params
				arrived_event_id = Move_Finished
				finished_event_id = Enter_Crosswalk_Done}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = bv_moveto_once_interact
						params = [{name = no_name ref = all_params}
							{name = path_segment val = true}
							{name = finished_event_id val = Move_Finished}]
					}]
			}
			{events = [Enter_Crosswalk_Done]
				responses = [{replacement = child
						state = interact_finishcurnode}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = interact_clearcurnode}]
			}]
	}
	registerstate {
		name = Bv_UseCrosswalk
		task = {name = Task_UseCrosswalk
			params = {no_name = all_params
				finished_event_id = Use_Crosswalk_Done
				look_percent = 0.5}
		}
		transitions = [{events = [Use_Crosswalk_Done]
				responses = [{replacement = child
						state = interact_finishcurnode
						params = [{name = ignore_links val = true}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_UseCrosswalk
		transitions = [{events = [enter_behavior]
				conditions = [{name = IsCrosswalkEntrance_Script result = true}]
				responses = [{replacement = child
						state = Bv_EnterCrosswalk}]
			}
			{events = [enter_behavior]
				conditions = [{name = IsCrosswalkEntrance_Script result = false}]
				responses = [{replacement = child
						state = Bv_UseCrosswalk}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = finished
						state = interact_finishcurnode}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_SlideToAndUnlock
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_InteractNode_SlideTo
						params = [{name = no_name ref = all_params}]
					}
				]
			}
			{events = [SlideToAndAlign_Finished]
				responses = [{replacement = child
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_RunInteractNodeBehavior
		task = {name = Task_RunInteractNodeBehavior}
	}
	registerstate {
		name = Bv_InteractNode_SlideTo
		task = {name = Task_SlideTo
			params = {interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				align = false
				blend_vert = false
				traverse_all = false
				finished_event_id = SlideTo_Finished
				slide_and_align_finished_event_id = SlideToAndAlign_Finished
				movement_desc = {force_align = true shuffle = false}
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = agent_setlockedtonode
						params = [{name = no_name val = true}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = agent_setlockedtonode
						params = [{name = no_name val = false}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_AlignTo
		task = {name = Task_AlignTo
			params = {interest_type_id = interact
				finished_event_id = AlignTo_Finished
				movement_desc = {force_align = true shuffle = false}
			}
		}
	}
	registerstate {
		name = Bv_InteractNode_MoveAndUse_WaitForReaction
		transitions = [{conditions = [{name = Agent_IsCalmAndNotReacting}]
				responses = [{replacement = this
						state = Bv_InteractNode_MoveAndUse_ManageBoard
					}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_MoveAndUse_ManageBoard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = skateboard
						state = Bv_SkaterPed_HandleBoardTransition
					}]
			}
			{events = [ManageSkateboard_NothingToDo
					AcquireVehicle_Failed
					ReleaseVehicle_Failed
					AcquireVehicle_Finished
					ReleaseVehicle_Finished]
				responses = [{replacement = reaction
						state = Bv_SetReactionState_Scr
					}
					{replacement = this
						state = Bv_InteractNode_MoveAndUse
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_MoveAndUse
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = move
				params = {finished_event_id = Move_Finished}
			}
		}
		transitions = [{events = [Move_Finished]
				responses = [{replacement = this
						state = Bv_RunInteractNodeBehavior
						params = [{name = type val = use}]
					}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_PlayAnimSet
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = lock
						state = Bv_InteractNode_SlideTo
					}
					{
						replacement = anim
						state = Bv_PlayAnimSet
						params =
						[
							{name = anim_stage val = custom}
							{name = anim_set_id ref = anim_set_id}
							{name = sync_start_time val = false}
							{name = finished_event_id ref = finished_event_id}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_LinkedTransition
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = lock
						state = Bv_InteractNode_SlideTo
					}
					{
						replacement = anim
						state = Bv_PlayAnimSet
						params =
						[
							{name = anim_stage val = custom}
							{name = anim_set_id ref = anim_set_id}
							{name = sync_start_time val = false}
							{name = finished_event_id ref = finished_event_id}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_AnimScript_WaitForReaction
		transitions = [{conditions = [{name = Agent_IsCalmAndNotReacting}]
				responses = [{replacement = this
						state = Bv_InteractNode_AnimScript_ManageBoard
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_AnimScript_ManageBoard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = skateboard
						state = Bv_SkaterPed_HandleBoardTransition
					}]
			}
			{events = [ManageSkateboard_NothingToDo
					AcquireVehicle_Failed
					ReleaseVehicle_Failed
					AcquireVehicle_Finished
					ReleaseVehicle_Finished]
				responses = [{replacement = reaction
						state = Bv_SetReactionState_Scr
					}
					{replacement = this
						state = bv_runbehavior
						params = [{name = behavior_id ref = interact_behavior_id}
							{name = behavior_params ref = params}
							{name = run_behavior_finished_event_id ref = finished_event_id}
							{name = run_behavior_interrupt_event_id ref = interrupt_event_id}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_ManageReactionState
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = agent_pushreactionstate
						params = [{name = state ref = state}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = agent_popreactionstate
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_AnimScript
		transitions = [{events = [enter_behavior]
				responses = [{replacement = exit_state state = Bv_Interact_InvalidateOnExit}
					{replacement = animscript state = Bv_InteractNode_AnimScript_WaitForReaction
						params = [{name = params ref = all_params}
							{name = interact_behavior_id ref = user_data}
							{name = finished_event_id val = AnimScript_Finished}
							{name = interrupt_event_id val = AnimScript_Interrupted}]
					}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = animscript
						state = bv_blank
					}]
			}
			{events = [Set_Reaction_State]
				recur = true
				responses = [{replacement = reaction
						state = Bv_InteractNode_ManageReactionState
						params = [{name = no_name ref = all_params}]
					}]
			}
			{events = [Clear_Reaction_State]
				recur = true
				responses = [{replacement = reaction
						state = bv_blank
					}]
			}
			{events = [Set_Exit_Anim]
				responses = [{replacement = exit_state
						state = Bv_InteractNode_ManageExitAnim
						params = [{name = no_name ref = all_params}]
					}]
			}
			{events = [Clear_Exit_Anim]
				responses = [{replacement = exit_state
						state = Bv_Interact_InvalidateOnExit
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = animscript
						state = agent_finishcustomanim
					}]
			}]
	}
	registerstate {
		name = Bv_AlignToInteractNode
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.5
				max_duration_secs = 0.5
				event_id = NodeLocked_Align_Finished}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = Bv_NodeLockedCustomAnim_Move
						params = [{name = time ref = 0.5}]
					}
				]
			}
			{events = [NodeLocked_Align_Finished]
				responses = [{replacement = move
						state = bv_blank
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_ManageExitAnim
		transitions = [{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = child
						state = Bv_Interact_PlayExitAnim
						params = [{name = no_name ref = all_params}]
					}]
			}
			{events = [AnimScript_Finished]
				responses = [{replacement = child
						state = Bv_Interact_PlayExitAnim
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_Interact_PlayExitAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = agent_playcustomanim
						params = [{name = anim val = `default`}
							{name = anim ref = anim}
							{name = blend_period val = 0.2}
							{name = blend_period ref = blend_period}
							{name = finished_event_id val = ExitAnim_Finished}]
					}]
			}
			{events = [ExitAnim_Finished]
				responses = [{replacement = invalidate state = Bv_InteractNode_ExitAnimScript}]
			}]
	}
	registerstate {
		name = Bv_Interact_InvalidateOnExit
		transitions = [{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished
						state = Bv_InteractNode_ExitAnimScript
					}]
			}
			{
				events = [AnimScript_Finished]
				responses = [{replacement = finished
						state = Bv_InteractNode_ExitAnimScript
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_ExitAnimScript
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move
						state = bv_stand
					}
					{replacement = anims
						state = agent_finishcustomanim
					}
					{replacement = finished
						state = interact_finishcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_Interact_PlayAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = no_name ref = cycle}
							{name = blend_period ref = blend_period}
							{name = event_id val = Interact_Anim_Finished}]
					}]
			}]
	}
	registerstate {
		name = Bv_InteractNode_FixedPathSkaterPed
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_FixedPathSkaterPed_Interact
						params = [{name = node ref = user_data}]
					}]
			}
			{events = [skater_path_finished]
				responses = [{replacement = child
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = bv_invalidinteractionnode
		transitions = []}
	registerstate {
		name = Bv_RunMasterNodeAction
		task = {name = Task_RunMasterNodeAction}
	}
	registerstate {
		name = Bv_MasterNode_Intersection
		task = {name = Task_Intersection}
	}
endscript

script IsCrosswalkEntrance_Script 
	if IsCrosswalkEntrance
		return \{true}
	else
		return \{false}
	endif
endscript

script Bv_SetReactionState_Scr 
	agent_popreactionstate
	if agent_hasvehicleofspecies \{species = skateboard}
		agent_pushreactionstate \{state = skate}
	else
		agent_pushreactionstate \{state = normal}
	endif
endscript

script Interact_SceneInterruption 
	agent_setsceneinterruptionparams <...>
	if (<type> = critical)
		if NOT (<response> = ambient)
			Navigation_ScenePauseMovement
		endif
	endif
endscript
