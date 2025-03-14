
script RegisterBehaviors_GenEvents_ItemControl 
	registerstate \{name = Bv_GenEvents_ItemControl_Reload
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = itemcontrol_reload
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_ItemControl_Equip
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = itemcontrol_equip
			}
		}
		transitions = [
		]}
	registerstate \{name = Bv_GenEvents_ItemControl_Movement
		task = {
			name = Task_GenEvents
			params = {
				event_gen_id = itemcontrol_movement
			}
		}
		transitions = [
		]}
endscript
