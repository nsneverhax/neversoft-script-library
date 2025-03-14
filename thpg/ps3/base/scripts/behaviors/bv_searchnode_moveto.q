
script RegisterBehaviors_SearchNode_MoveTo 
	search_node_movement_desc = {
		id = search_node_movement_desc
		movement = walk_slow
		arrival_distance = 0.2
		stop_distance = 0
	}
	registerstate {
		name = Bv_SearchNode_MoveTo
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move
						state = Bv_MoveTo_Loop_Interact
						params = [{name = finished_event_id ref = finished_event_id}
							{name = movement_desc val = <search_node_movement_desc>}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_SearchNode_StandMoveTo
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = stand
						state = bv_stand
					}
					{replacement = move
						state = Bv_MoveTo_Loop_Interact
						params = [{name = finished_event_id ref = finished_event_id}
							{name = movement_desc val = <search_node_movement_desc>}]
					}
				]
			}
		]
	}
endscript
