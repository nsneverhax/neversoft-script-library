
script RegisterBehaviors_MoveTo_Once 
	registerstate {
		name = bv_setmovedesc
		task = {name = task_setmovedesc}
	}
	registerstate {
		name = Bv_MoveTo_Once_Location
		task = {name = Task_MoveTo
			params = {interest_type_id = location
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = bv_moveto_once_interact
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = Bv_MoveTo_Once_Transit
		task = {name = Task_MoveTo
			params = {interest_type_id = transit
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = bv_moveto_once_center
		task = {name = Task_MoveTo
			params = {interest_type_id = center
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = Bv_MoveTo_Once_Enemy
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
	registerstate {
		name = Bv_MoveTo_Once_Target
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_MoveTo_Loop_Target}]}
			{events = [MoveTo_Finished] ,
				responses = [{replacement = this state = bv_blank}]}
		]}
endscript

script RegisterBehaviors_MoveTo_Loop 
	registerstate {
		name = Bv_StopInDirection
		task = {name = task_runscript
			params = {script_name = navigation_stopindirection}
		}
		transitions = [{
				events = [exit_behavior]
				responses = [{replacement = child
						state = Bv_ClearStopDirection
					}
				]
			}
		]}
	registerstate {
		name = Bv_Stop
		task = {name = task_runscript
			params = {script_name = navigation_stop}
		}
		transitions = []}
	registerstate {
		name = Bv_StopInstant
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = stop_nav
						state = navigation_stop
					}
					{replacement = stop_seek
						state = seek_stop
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_ClearStopDirection
		task = {name = task_runscript
			params = {script_name = navigation_clearstopdirection}
		}
		transitions = []}
	registerstate {
		name = Bv_StopInDirection_Interact
		task = {name = task_runscript
			params = {script_name = navigation_stopindirection
				script_params = {interest = interact}}
		}
		transitions = [{
				events = [exit_behavior]
				responses = [{replacement = child
						state = navigation_clearstopdirection
					}
				]
			}
		]}
	registerstate {
		name = Bv_MoveToAndStopInDirection
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child
						state = Bv_MoveTo
						params = [{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = finished_event_id ref = finished_event_id}]
					}
				]
			}
			{events = [MoveTo_Finished]
				responses = [{replacement = child
						state = Bv_StopInDirection
						params = [{name = node ref = waypoint}
							{name = direction ref = direction}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_EquippedMoveToAndStopInDirection
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_MoveToAndStopInDirection
						params = [{name = no_name ref = all_params}]
					}
					{replacement = equip state = Bv_EnableItemControlEquip}
				]
			}
		]
	}
	registerstate {
		name = Bv_MoveTo
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child
						state = agent_setareas
						params = [{name = location ref = waypoint}
							{name = location ref = object}]}
					{replacement = this
						state = bv_moveto_loop_location
						params = [{name = movement_desc ref = movement_desc}
							{name = path_segment ref = path_segment}
							{name = offset_movement_desc ref = offset_movement_desc}
							{name = relative_offset_type ref = relative_offset_type}
							{name = relative_offset ref = relative_offset}
							{name = finished_event_id ref = finished_event_id}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MoveTo_Loop
		task = {name = Task_MoveTo
			params = {
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
	}
	registerstate {
		name = Bv_Equipped_MoveTo_Loop
		task = {name = Task_MoveTo
			params = {
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = equip state = Bv_EnableItemControlEquip}]}
		]}
	registerstate {
		name = bv_moveto_loop_location
		task = {name = Task_MoveTo
			params = {interest_type_id = location
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_MoveTo_Loop_Interact
		task = {name = Task_MoveTo
			params = {interest_type_id = interact
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`
		task = {name = Task_MoveTo
			params = {interest_type_id = center
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_MoveTo_Loop_Enemy
		task = {name = Task_MoveTo
			params = {interest_type_id = enemy
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_MoveTo_Loop_Investigate
		task = {name = Task_MoveTo
			params = {interest_type_id = investigate
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_MoveTo_Loop_Target
		task = {name = Task_MoveTo
			params = {interest_type_id = target
				relative_offset_type = world
				relative_offset = (0.0, 0.0, 0.0)
				finished_event_id = MoveTo_Finished
			}
		}
		transitions = []}
	registerstate {
		name = Bv_MoveToWithOffset_Loop
		task = {name = Task_MoveTo
			params = {
			}
		}
	}
endscript

script Bv_Follow hierarchy = order
	<interest_type_id> = center
	if gotparam object
		agent_setinterest {interest_type_id = <interest_type_id> , object_id = <object> , acquire_vis_loc = true}
	else
		if gotparam waypoint
			agent_setinterest {interest_type_id = <interest_type_id> , waypoint = <waypoint> , acquire_vis_loc = true}
		else
			agent_setinterest {interest_type_id = <interest_type_id> , cell = <cell> , pos = <pos> , acquire_vis_loc = true}
		endif
	endif
	if gotparam world_offset
		<relative_offset_type> = world
		<relative_offset> = <world_offset>
	else
		if gotparam local_offset
			<relative_offset_type> = alignment
			<relative_offset> = <local_offset>
		else
			<relative_offset_type> = movement
			<relative_offset> = <movement_offset>
		endif
	endif
	<finished_event_id> = Follow_Finished
	ai_giveorder name = Bv_Equipped_MoveTo_Loop params = {<...>}
	if gotparam BlockUntilFinished
		blockuntilevent anytypes = [Follow_Finished path_blocked]
	endif
endscript
