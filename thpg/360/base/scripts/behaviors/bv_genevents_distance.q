
script RegisterBehaviors_GenEvents_Distance 
	registerstate \{name = Bv_GenEvents_Distance
		task = {
			name = Task_GenEvents_Distance
			params = {
				less_than = lessthan
				greater_than = greaterthan
				distance = 2.5
				interest_type_id = enemy
			}
		}}
endscript
