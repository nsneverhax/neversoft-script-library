
script RegisterBehaviors_Steer 
	registerstate \{name = Bv_AcquireSteering
		task = {
			name = Task_Steer
			params = {
				interest_type_id = vehicle
				steer = on
				finished_event_id = AcquireSteering_Finished
				failed_event_id = AcquireSteering_Failed
			}
		}}
	registerstate \{name = Bv_ReleaseSteering
		task = {
			name = Task_Steer
			params = {
				interest_type_id = vehicle
				steer = off
				finished_event_id = ReleaseSteering_Finished
				failed_event_id = ReleaseSteering_Failed
			}
		}}
endscript
