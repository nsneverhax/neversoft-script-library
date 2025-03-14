
script RegisterBehaviors_GenEvents_AimedAtBy 
	registerstate \{name = Bv_GenEvents_AimedAtBy_Center
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = aimedatby_center
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_AimedAtBy_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = aimedatby_enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_AimedAtBy_Target
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = aimedatby_target
			}
		}
		transitions = [
		]}
endscript

script RegisterBehaviors_GenEvents_VehicleAimedAtBy 
	registerstate \{name = Bv_GenEvents_VehicleAimedAtBy_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = aimedatby_enemy
			}
		}
		transitions = [
		]}
endscript
