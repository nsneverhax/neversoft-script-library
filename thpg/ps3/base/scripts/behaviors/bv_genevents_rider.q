
script RegisterBehaviors_GenEvents_Rider 
	registerstate \{name = Bv_GenEvents_IsRider
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = IsRider
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_IsRider_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = IsRider_Enemy
			}
		}
		transitions = [
		]}
endscript
