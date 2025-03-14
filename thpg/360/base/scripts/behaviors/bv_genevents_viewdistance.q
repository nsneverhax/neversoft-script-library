
script RegisterBehaviors_GenEvents_ViewDistance 
	registerstate \{name = Bv_GenEvents_ViewDistance_Center
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = viewdistance_center
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_ViewDistance_Enemy
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = viewdistance_enemy
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_ViewDistance_Target
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = viewdistance_target
			}
		}
		transitions = [
		]}
endscript
