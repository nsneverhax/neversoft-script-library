
script RegisterBehaviors_MoveTo_PrevVisLoc 
	registerstate \{name = Bv_MoveTo_PrevVisLoc_Center
		task = {
			name = Task_MoveTo_PrevVisLoc
			params = {
				interest_type_id = center
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_MoveTo_PrevVisLoc_Enemy
		task = {
			name = Task_MoveTo_PrevVisLoc
			params = {
				interest_type_id = enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_MoveTo_PrevVisLoc_Target
		task = {
			name = Task_MoveTo_PrevVisLoc
			params = {
				interest_type_id = target
			}
		}
		transitions = [
		]}
endscript
