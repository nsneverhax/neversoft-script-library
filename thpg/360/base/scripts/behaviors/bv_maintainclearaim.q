MaintainClearAim_MovementDesc = {
	id = MaintainClearAim_MovementDesc
	movement = run_fast
}

script RegisterBehaviors_MaintainClearAim 
	registerstate {name = Bv_MaintainClearAim
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = MaintainClearAim_MovementDesc}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = viewdist state = Bv_GenEvents_ViewDistance_Enemy}
					{replacement = look state = Bv_AimAt_Target}]}
			{conditions = [{name = agent_hasclearaim result = false}]
				responses = [{replacement = this state = Bv_MaintainClearAim_LostClearAim}]}
			{events = [viewdistance_enemy_far] ,
				responses = [{replacement = this state = Bv_MaintainClearAim_LostDistance}]}
		]}
	registerstate {name = Bv_MaintainClearAim_LostClearAim
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_enemy}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_MoveTo_Loop_Enemy}
					{replacement = look state = Bv_AimAt_Target}]}
			{conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_MaintainClearAim}]}
			{events = [viewdistance_enemy_far] ,
				responses = [{replacement = this state = Bv_MaintainClearAim_LostDistance}]}
		]}
	registerstate {name = Bv_MaintainClearAim_LostDistance
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_enemy}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_MoveTo_Loop_Enemy}
					{replacement = look state = Bv_AimAt_Target}]}
			{events = [viewdistance_enemy_near] ,
				responses = [{replacement = this state = Bv_MaintainClearAim}]}
		]}
endscript
