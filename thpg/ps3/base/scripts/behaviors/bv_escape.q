
script RegisterBehaviors_Escape_Once 
	registerstate {
		name = Bv_Escape_Once
		task = {name = Task_Escape
			params = {center_interest_type_id = center
				finished_event_id = Escape_Finished
				failed_event_id = Escape_Failed}}
		transitions = []}
	registerstate {
		name = Bv_Escape_Once_Center
		task = {name = Task_Escape
			params = {target_interest_type_id = center
				center_interest_type_id = center
				finished_event_id = Escape_Finished
				failed_event_id = Escape_Failed}}
		transitions = []}
	registerstate {
		name = Bv_Escape_Once_Enemy
		task = {name = Task_Escape
			params = {target_interest_type_id = enemy
				center_interest_type_id = center
				finished_event_id = Escape_Finished
				failed_event_id = Escape_Failed}}
		transitions = []}
	registerstate {
		name = Bv_Escape_Once_Target
		task = {name = Task_Escape
			params = {target_interest_type_id = target
				center_interest_type_id = center
				finished_event_id = Escape_Finished
				failed_event_id = Escape_Failed}}
		transitions = []}
	registerstate {
		name = Bv_Escape_Once_Location
		task = {name = Task_Escape
			params = {target_interest_type_id = location
				center_interest_type_id = center
				finished_event_id = Escape_Finished
				failed_event_id = Escape_Failed}}
		transitions = []}
endscript

script RegisterBehaviors_Escape_Loop 
	registerstate {
		name = Bv_Escape_Loop
		transitions = [{events = [enter_behavior Escape_Finished] ,
				recur = true ,
				responses = [{replacement = child
						state = Bv_Escape_Once
						params = [{name = target_interest_type_id ref = target_interest_type_id}
							{name = movement_desc ref = movement_desc}
							{name = path_stage ref = path_stage}
							{name = move_desc_stage ref = move_desc_stage}]
					}]
			}]
	}
	registerstate {
		name = Bv_Escape_Loop_Center
		transitions = [{events = [enter_behavior Escape_Finished] ,
				recur = true ,
				responses = [{replacement = child
						state = Bv_Escape_Once_Center
						params = [{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}
							{name = movement_desc ref = movement_desc}]
					}]
			}]
	}
	registerstate {
		name = Bv_Escape_Loop_Enemy
		transitions = [{events = [enter_behavior Escape_Finished] ,
				recur = true
				responses = [{replacement = child
						state = Bv_Escape_Once_Enemy
						params = [{name = move_desc_stage ref = move_desc_stage}
							{name = path_stage ref = path_stage}
							{name = movement_desc ref = movement_desc}]
					}]
			}]
	}
	registerstate {
		name = Bv_Escape_Loop_Target
		transitions = [{events = [enter_behavior Escape_Finished] ,
				recur = true
				responses = [{replacement = child
						state = Bv_Escape_Once_Target
						params = [{name = movement_desc ref = movement_desc}
							{name = path_stage ref = path_stage}
							{name = move_desc_stage ref = move_desc_stage}]
					}]
			}]
	}
	registerstate {
		name = Bv_Escape_Loop_Location
		transitions = [{events = [enter_behavior Escape_Finished] ,
				recur = true
				responses = [{replacement = child
						state = Bv_Escape_Once_Location
						params = [{name = movement_desc ref = movement_desc}
							{name = path_stage ref = path_stage}
							{name = move_desc_stage ref = move_desc_stage}]
					}]
			}
			{events = [Escape_Failed]
				responses = [{replacement = child
						state = eventcache_add
						params = [{name = event_id val = Escape_Location_Finished}
							{name = event_id ref = finished_event_id}]
					}]
			}
		]
	}
endscript
