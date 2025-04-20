
script RegisterBehaviors_GenEvents_Visibility 
	registerstate \{name = Bv_GenEvents_Visibility_Center
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = visibility_center
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_Visibility_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = visibility_enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_Visibility_Target
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = visibility_target
			}
		}
		transitions = [
		]}
endscript
