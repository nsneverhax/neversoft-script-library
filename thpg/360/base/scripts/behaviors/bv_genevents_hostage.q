
script RegisterBehaviors_GenEvents_Hostage 
	registerstate \{name = Bv_GenEvents_IsHostage
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = IsHostage
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_HasHostage
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = HasHostage
			}
		}
		transitions = [
		]}
endscript
