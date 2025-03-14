
script RegisterBehaviors_EnableVision 
	registerstate {
		name = Bv_EnableVision
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = enemy_vision state = Bv_EnableVision_Enemy}
					{replacement = target_vision state = Bv_EnableVision_Target}]}
		]}
	registerstate {
		name = Bv_EnableVision_Enemy
		task = {name = Task_EnableVision
			params = {interest_type_id = enemy}}
		transitions = []}
	registerstate {
		name = Bv_EnableVision_Target
		task = {name = Task_EnableVision
			params = {interest_type_id = target}}
		transitions = []}
endscript
