
script RegisterBehaviors_LifeSpan 
	registerstate \{name = Bv_Die
		task = {
			name = task_runscript
			params = {
				script_name = die
			}
		}
		transitions = [
		]}
endscript
