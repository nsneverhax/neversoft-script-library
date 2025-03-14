Task_SetLocationInterest = {
	enter = Enter_SetLocationInterest
}

script Enter_SetLocationInterest 
	if gotparam \{task_params}
		<name> = (<task_params>.name)
		if gotparam \{name}
			Interest_SetLocation {location = <name>}
		endif
	endif
	Interest_GetLocation
	if NOT gotparam \{name}
		scriptassert \{"'name' to set as interest is not specified"}
	endif
endscript

script RegisterBehaviors_LookAt 
	registerstate {
		name = Bv_LookAt
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = movedesc
						state = Navigation_SetMoveDescription
						params = [{name = movement_desc val = {force_align = false shuffle = true}}]
					}
					{replacement = lookie
						state = Bv_LookAt_Location
					}
				]
			}
		]
	}
	registerstate {
		name = bv_LookAt_Shuffle
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = movedesc
						state = Navigation_SetMoveDescription
						params = [{name = movement_desc val = {force_align = false shuffle = true}}]
					}
					{replacement = lookie
						state = Bv_LookAt_Location
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_LookAt_ExactShuffle
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = movedesc
						state = Navigation_SetMoveDescription
						params = [{name = movement_desc val = {force_align = true shuffle = true}}]
					}
					{replacement = lookie
						state = Bv_LookAt_Location
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_LookAt_Spin
		task = {name = Task_SetLocationInterest}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = lookie
						state = Bv_LookAt_Location
						params = [{name = movement_desc val = {force_align = true shuffle = false}}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_LookAt_Interact
		task = {name = Task_LookAt params = {interest_type_id = interact}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Center
		task = {name = Task_LookAt params = {interest_type_id = center}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Enemy
		task = {name = Task_LookAt params = {interest_type_id = enemy}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Target
		task = {name = Task_LookAt params = {interest_type_id = target}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Investigate
		task = {name = Task_LookAt params = {interest_type_id = investigate}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Location
		task = {name = Task_LookAt params = {interest_type_id = location}}
		transitions = []}
	registerstate {
		name = Bv_LookAt_Reaction
		task = {name = Task_LookAt params = {interest_type_id = reaction}}
		transitions = []}
endscript
