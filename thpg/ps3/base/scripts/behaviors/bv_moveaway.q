ESCAPE_MIN_TIME = 10.0

script RegisterBehaviors_MoveAway 
	registerstate {
		name = Bv_MoveAway_Loop_Enemy
		task = {name = Task_MoveAway
			params = {interest_type_id = enemy}}
		transitions = []
	}
	registerstate {
		name = Bv_MoveAway_Loop_Danger
		task = {name = Task_MoveAway
			params = {interest_type_id = danger}}
		transitions = []
	}
	registerstate {
		name = Bv_MoveAway_Loop_Location
		task = {name = Task_MoveAway
			params = {interest_type_id = location}}
		transitions = []
	}
	registerstate {
		name = Bv_MoveAway_Loop_Interact
		task = {name = Task_MoveAway
			params = {interest_type_id = interact}}
		transitions = []
	}
	registerstate {
		name = Bv_MoveAway_Loop
		task = {name = Task_MoveAway}
		transitions = []
	}
	registerstate {
		name = Bv_MoveAwayToMaxDist_Loop_Location
		transitions = [{events = [enter_behavior MoveAwayToMaxDist_TooClose]
				responses = [{replacement = watch_distance
						state = Bv_GenEvents_Distance
						params = [{name = less_than val = MoveAwayToMaxDist_TooClose}
							{name = greater_than val = MoveAwayToMaxDist_TooFar}
							{name = distance ref = max_distance}
							{name = distance val = 25}
							{name = interest_type_id val = location}]
					}
					{replacement = child
						state = Bv_MoveAwayThenEscape_Location
						params = [{name = movement_desc ref = movement_desc}
							{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}]
					}
				]
			}
			{events = [MoveAwayToMaxDist_TooFar]
				responses = [{replacement = child
						state = bv_blank
					}
					{replacement = evn
						state = eventcache_add
						params = [{name = event_id val = MoveAwayMaxDist_Finished}
							{name = event_id ref = finished_event_id}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MoveAwayToMaxDist_Loop_Reaction
		transitions = [{events = [enter_behavior MoveAwayToMaxDist_TooClose]
				responses = [{replacement = watch_distance
						state = Bv_GenEvents_Distance
						params = [{name = less_than val = MoveAwayToMaxDist_TooClose}
							{name = greater_than val = MoveAwayToMaxDist_TooFar}
							{name = distance ref = max_distance}
							{name = distance val = 25}
							{name = interest_type_id val = reaction}]
					}
					{replacement = child
						state = Bv_MoveAwayThenEscape_Reaction
						params = [{name = movement_desc ref = movement_desc}
							{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}]
					}
				]
			}
			{events = [MoveAwayToMaxDist_TooFar]
				responses = [{replacement = child
						state = bv_blank
					}
					{replacement = evn
						state = eventcache_add
						params = [{name = event_id val = MoveAwayMaxDist_Finished}
							{name = event_id ref = finished_event_id}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_MoveAwayToMaxDist_Loop_Enemy
		transitions = [{events = [enter_behavior MoveAwayToMaxDist_TooClose]
				responses = [{replacement = watch_distance
						state = Bv_GenEvents_Distance
						params = [{name = less_than val = MoveAwayToMaxDist_TooClose}
							{name = greater_than val = MoveAwayToMaxDist_TooFar}
							{name = distance ref = max_distance}
							{name = distance val = 25}
							{name = interest_type_id val = enemy}]
					}
					{replacement = child
						state = Bv_MoveAwayThenEscape_Enemy
						params = [{name = movement_desc ref = movement_desc}
							{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}]
					}
				]
			}
			{events = [MoveAwayToMaxDist_TooFar]
				responses = [{replacement = child
						state = bv_blank
					}
				]
			}
		]
	}
	Register_MoveAwayThenEscape_Behavior behavior_id = Bv_MoveAwayThenEscape_Location interest_id = location
	Register_MoveAwayThenEscape_Behavior behavior_id = Bv_MoveAwayThenEscape_Reaction interest_id = reaction
	Register_MoveAwayThenEscape_Behavior behavior_id = Bv_MoveAwayThenEscape_Enemy interest_id = enemy
endscript

script Register_MoveAwayThenEscape_Behavior 
	registerstate {
		name = <behavior_id>
		transitions = [{events = [enter_behavior start_moveaway_from_escape]
				responses = [
					{replacement = another
						state = bv_stand
					}
					{replacement = child
						state = Bv_MoveAway_Loop
						params = [{name = interest_type_id val = <interest_id>}
							{name = movement_desc ref = movement_desc}
							{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}
							{name = failed_event_id val = start_escape_from_moveaway}
							{name = finished_event_id val = start_escape_from_moveaway}]
					}
				]
			}
			{events = [start_escape_from_moveaway]
				responses = [
					{replacement = another
						state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = ESCAPE_MIN_TIME}
							{name = max_duration_secs val = ESCAPE_MIN_TIME}
							{name = event_id val = start_moveaway_from_escape}]
					}
					{replacement = child
						state = Bv_Escape_Loop
						params = [{name = target_interest_type_id val = <interest_id>}
							{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}
							{name = finished_event_id val = moveawaythenescape_finished}]
					}
				]
			}
		]
	}
endscript

script Bv_MoveAway \{hierarchy = logic
		max_dist = 500}
	if NOT gotparam \{center}
		<center> = <object>
	endif
	agent_setinterest {interest_type_id = location , object_id = <object> , acquire_vis_loc = true}
	agent_setinterestmaxdesireddist {interest_type_id = location , max_dist = <max_dist>}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_MoveAwayToMaxDist_Loop_Location
		params = {interest_type_id = location
			finished_event_id = MoveAway_Finished
			max_dist = <max_dist>}}
endscript
