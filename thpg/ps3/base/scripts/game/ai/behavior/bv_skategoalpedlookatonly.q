
script RegisterBehaviors_SkateGoalPedLookAtOnly 
	registerstate {
		name = Bv_GoalPedLookAtOnly
		transitions = [{
				events = [enter_behavior]
				responses = [{
						replacement = detect
						state = Bv_LookAtInRangeDetect
					}
					{
						replacement = collision
						state = Bv_CollisionController
					}
					{
						replacement = state
						state = Bv_GoalPedLookAtOnly_UseInteractionNodes
					}]
			}]
	}
	registerstate {
		name = Bv_GoalPedLookAtOnly_UseInteractionNodes
		transitions = [{events = [enter_behavior] responses = [{replacement = child state = Bv_Agent_Life}]}
			{events = [Start_Look_At_In_Range] responses = [{replacement = this state = Bv_GoalPedLookAtOnly_LookAt}]}]
	}
	registerstate {
		name = Bv_GoalPedLookAtOnly_LookAt
		transitions = [{events = [enter_behavior] responses = [{replacement = stop state = bv_stand}]}
			{events = [enter_behavior] responses = [{replacement = child state = Bv_LookAtInRange}]}
			{events = [Look_At_In_Range_Done] responses = [{replacement = this state = Bv_GoalPedLookAtOnly_UseInteractionNodes}]}]
	}
endscript
