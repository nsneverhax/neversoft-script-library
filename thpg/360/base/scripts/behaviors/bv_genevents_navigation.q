
script RegisterBehaviors_GenEvents_Navigation 
	registerstate \{name = Bv_GenEvents_Navigation_Finished
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = navigation_finished
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_Navigation_Blocked
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = navigation_blocked
			}
		}
		transitions = [
		]}
endscript
