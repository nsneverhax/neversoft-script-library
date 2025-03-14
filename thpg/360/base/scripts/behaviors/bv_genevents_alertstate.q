
script RegisterBehaviors_GenEvents_AlertState 
	registerstate \{name = Bv_GenEvents_AlertState
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = alertstate
			}
		}
		transitions = [
		]}
endscript
