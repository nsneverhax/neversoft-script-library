
script RegisterBehaviors_Cheat 
	registerstate \{name = Bv_Cheat_AcquireVisLoc_Once_Enemy
		task = {
			name = task_runscript
			params = {
				script_name = agent_acquireinterestvisloc
				script_params = {
					interest_type_id = enemy
				}
			}
		}
		transitions = [
		]}
endscript
