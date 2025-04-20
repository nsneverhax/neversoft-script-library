
script RegisterBehaviors_Anims_Custom 
	registerstate {
		name = Bv_Anims_Custom
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = no_name ref = cycle}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [CustomAnimation_Finished]
				responses = [{replacement = this
						state = Bv_Anims_Human
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Anims_CustomHold
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [StopCustomAnimation_Hold]
				responses = [{replacement = this
						state = Bv_Anims_Human
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Anims_CustomSequence
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = no_name val = sequence}
							{name = blend_period ref = blend_period}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [CustomAnimation_Finished]
				responses = [{replacement = this
						state = Bv_Anims_Human
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Anims_CustomLoop
		transitions = [{events = [enter_behavior start_custom_anim]
				recur = true
				responses = [{
						replacement = anim
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = event_id val = start_custom_anim}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [CustomAnimation_Finished]
				responses = [{replacement = this
						state = Bv_Anims_Human
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CustomAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name ref = cycle}
							{name = no_name ref = sequence}
							{name = speed ref = speed}
							{name = no_name val = motion_extract}
							{name = no_name ref = extract_vertical_motion}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CustomAnimNoMotionExtract
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name ref = cycle}
							{name = no_name ref = sequence}
							{name = speed ref = speed}
							{name = no_name ref = extract_vertical_motion}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CustomAnimWithoutGravity
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_CustomAnim
						params = [{name = no_name ref = all_params}]
					}
					{replacement = grav
						state = Bv_PauseGravity
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CustomAnimLoop
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name val = cycle}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_NodeLockedCustomAnim
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.4
				max_duration_secs = 0.4
				event_id = NodeLocked_Start_Anim}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = interest
						state = Interest_SetInteract
						params = [{name = interact ref = node}]
					}
					{replacement = move
						state = Bv_NodeLockedCustomAnim_Move
					}
				]
			}
			{events = [NodeLocked_Start_Anim]
				responses = [{replacement = anim
						state = Bv_LockedCustomAnim
						params = [{name = no_name ref = all_params}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_NodeLockedCustomAnimLoop
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.4
				max_duration_secs = 0.4
				event_id = NodeLocked_Start_Anim}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = interest
						state = Interest_SetInteract
						params = [{name = interact ref = node}]
					}
					{replacement = move
						state = Bv_NodeLockedCustomAnim_Move
					}
				]
			}
			{events = [NodeLocked_Start_Anim]
				responses = [{replacement = anim
						state = Bv_LockedCustomAnimLoop
						params = [{name = no_name ref = all_params}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_NodeLockedCustomAnimTimer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.4
				max_duration_secs = 0.4
				event_id = NodeLocked_Start_Anim}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = interest
						state = Interest_SetInteract
						params = [{name = interact ref = node}]
					}
					{replacement = move
						state = Bv_NodeLockedCustomAnim_Move
					}
				]
			}
			{events = [NodeLocked_Start_Anim]
				responses = [{replacement = anim
						state = Bv_LockedCustomAnimLoop
						params = [{name = no_name ref = all_params}]
					}
					{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs ref = min_duration_secs}
							{name = max_duration_secs ref = max_duration_secs}
							{name = event_id val = CustomAnimation_Finished}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_NodeLockedCustomAnim_Move
		task =
		{
			name = Task_SlideTo
			params =
			{
				interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				time = 0.5
				align = true
				blend_vert = false
				traverse_all = true
				path_stage = action
			}
		}
	}
	registerstate {
		name = Bv_NodeLockedCustomAnim_MoveAndUnlock
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_NodeLockedCustomAnim_Move
						params = [{name = no_name ref = all_params}]
					}
					{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs val = 0.5}
							{name = max_duration_secs val = 0.5}
							{name = event_id val = SlideTo_Finished}]
					}]
			}
			{events = [SlideTo_Finished]
				responses = [{replacement = child
						state = bv_blank
					}]
			}]
	}
	registerstate {
		name = Bv_LockedCustomAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name val = lock_movement}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_LockedCustomAnimLoop
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name val = cycle}
							{name = no_name val = lock_movement}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_RandomAnimLoop
		transitions = [{events = [enter_behavior RandomAnimation_Finished]
				recur = true
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = blend_period val = 0.5}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = RandomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_AlhambraPlayPiano
		transitions = [{events = [enter_behavior]
				responses = [{replacement = interest
						state = agent_setinterest
						params = [{name = interest_type_id val = center}
							{name = object_id val = hero}
							{name = acquire_vis_loc val = false}]
					}
					{replacement = proxim
						state = Bv_MaintainProxim
						params = [{name = proxim_node ref = proxim_node}
							{name = in_range_script ref = in_range_script}
							{name = out_of_range_script ref = out_of_range_script}]
					}
					{replacement = customanim
						state = Bv_NodeLockedCustomAnimLoop
						params = [{name = node ref = node}
							{name = anims ref = anims}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MaintainProxim
		task = {name = Task_GenEvents_Distance
			params = {less_than = InRange
				greater_than = OutOfRange
				distance = 1.25
				interest_type_id = center
				max_duration_secs = 0.4
				event_id = NodeLocked_Start_Anim}
		}
		transitions = [{events = [InRange]
				responses = [{replacement = child
						state = bv_runscript
						params = [{name = script_name ref = in_range_script}]
					}
				]
			}
			{events = [OutOfRange]
				responses = [{replacement = child
						state = bv_runscript
						params = [{name = script_name ref = out_of_range_script}]
					}
				]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = bv_runscript
						params = [{name = script_name ref = out_of_range_script}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CustomAnimAndStopOnExit
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = child
						state = Bv_AddEvent
						params = [{name = event_id val = CustomAnimation}
							{name = event_data ref = all_params}
						]
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
		name = Bv_CustomAnimHoldAndStopOnExit
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = child
						state = Bv_AddEvent
						params = [{name = event_id val = CustomAnimation_Hold}
							{name = event_data ref = all_params}
						]
					}
				]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = child
						state = Bv_AddEvent
						params = [{name = event_id val = StopCustomAnimation_Hold}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_RestoreAnims
		transitions = [{events = [enter_behavior]
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
		name = Bv_Anims_Animal_Custom
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = no_name ref = cycle}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [CustomAnimation_Finished]
				responses = [{replacement = this
						state = Bv_Anims_Animal_Main
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Anims_Animal_CustomLoop
		transitions = [{events = [enter_behavior start_custom_anim]
				recur = true
				responses = [{
						replacement = anim
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = event_id val = start_custom_anim}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [CustomAnimation_Finished]
				responses = [{replacement = this
						state = Bv_Anims_Animal_Main
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Anims_Animal_CustomHold
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_PlayAnim
						params = [{name = anim ref = anim}
							{name = anims ref = anims}
							{name = anim val = `default`}
							{name = speed ref = speed}
							{name = blend_period ref = blend_period}
							{name = custom_finished_event_id ref = custom_finished_event_id}
							{name = event_id val = CustomAnimation_Finished}
							{name = orient_type ref = orient_type}
						]
					}
				]
			}
			{events = [StopCustomAnimation_Hold]
				responses = [{replacement = this
						state = Bv_Anims_Animal_Main
					}
				]
			}
		]
	}
endscript
