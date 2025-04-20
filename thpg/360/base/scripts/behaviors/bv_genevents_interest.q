
script RegisterBehaviors_GenEvents_Interest 
	registerstate \{name = Bv_GenEvents_Interest_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = interest_enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_Interest_Investigate
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = interest_investigate
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_VehicleType
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = vehicletype
			}
		}
		transitions = [
		]}
endscript
