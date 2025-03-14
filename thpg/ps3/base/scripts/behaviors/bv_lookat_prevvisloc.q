
script RegisterBehaviors_LookAt_PrevVisLoc 
	registerstate \{name = Bv_LookAt_PrevVisLoc_Center
		task = {
			name = Task_LookAt_PrevVisLoc
			params = {
				interest_type_id = center
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_LookAt_PrevVisLoc_Enemy
		task = {
			name = Task_LookAt_PrevVisLoc
			params = {
				interest_type_id = enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_LookAt_PrevVisLoc_Target
		task = {
			name = Task_LookAt_PrevVisLoc
			params = {
				interest_type_id = target
			}
		}
		transitions = [
		]}
endscript
