
script RegisterBehaviors_GenEvents_Variance 
	registerstate {
		name = Bv_GenEvents_Variance
		transitions = [{events = [enter_behavior]
				responses = [{replacement = agnthlth state = Bv_GenEvents_AgentHealth_Variance}
					{replacement = sqdhlth state = Bv_GenEvents_Squadhealth_Variance}
				]
			}
		]
	}
	registerstate {
		name = Bv_GenEvents_AgentHealth_Variance
		task = {name = Task_GenEvents
			params = {event_gen_id = variance_agenthealth}
		}
	}
	registerstate {
		name = Bv_GenEvents_Squadhealth_Variance
		task = {name = Task_GenEvents
			params = {event_gen_id = variance_squadhealth}
		}
	}
	registerstate {
		name = Bv_GenEvents_AgentAmmo_Variance
		task = {name = Task_GenEvents
			params = {event_gen_id = variance_agentammo}
		}
	}
endscript
