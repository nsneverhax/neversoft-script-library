Task_RequestAssistance = {
	enter = RequestAssistance
}

script RequestAssistance 
	if NOT agent_isinterestvisible \{interest_type_id = enemy}
		return
	endif
	agent_requestassistance \{radius = 15.0}
endscript

script RegisterBehaviors_RequestAssistance 
	registerstate {
		name = Bv_ManageRequestAssistance
		task = {name = Task_GenEvents params = {event_gen_id = interest_enemy}}
		transitions = [{events = [got_interest_enemy]
				responses = [{replacement = this state = Bv_ManageRequestAssistance_Enemy}]}
		]}
	registerstate {
		name = Bv_ManageRequestAssistance_Enemy
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.5
				max_duration_secs = 0.6
				event_id = ManageRequestAssistance_Enemy_SendEvent}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = enemy state = Bv_GenEvents_Interest_Enemy}
					{replacement = event state = Bv_RequestAssistance}]}
			{events = [lost_interest_enemy]
				responses = [{replacement = this state = Bv_ManageRequestAssistance}]}
			{events = [ManageRequestAssistance_Enemy_SendEvent]
				recur = true
				responses = [{replacement = this state = Bv_ManageRequestAssistance_Enemy}]}
		]}
	registerstate {
		name = Bv_RequestAssistance
		task = {name = Task_RequestAssistance}
		transitions = []}
endscript
