
script RegisterSearchBehavior 
	registerstate {
		name = <new_behavior_name>
		task = {name = Task_ItemControlMovement}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = <search_behavior>}
				]}
			{events = [Got_DetectPickUp] ,
				recur = true
				responses = [{replacement = child state = Bv_MoveToPickup}]}
			{events = [Lost_DetectPickUp] ,
				responses = [{replacement = child state = <search_behavior>}]}
		]}
endscript

script RegisterBehaviors_Search 
	registerstate {
		name = Bv_MonitorSearchStatus
		task = {name = task_runscript
			params = {script_name = Agent_MonitorSearchStatus}}}
	registerstate {
		name = Bv_Search
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_GuardSearchNodes}
				]}
			{events = [Got_DetectPickUp] ,
				recur = true
				responses = [{replacement = child state = Bv_MoveToPickup}]}
			{events = [Lost_DetectPickUp] ,
				responses = [{replacement = child state = Bv_GuardSearchNodes}]}
		]}
	registerstate {
		name = Bv_SearchAndClearAlert
		task = {name = Task_SearchDurationTimer
			params = {finished_event_id = SearchDuration_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = search state = Bv_Search}]
			}
			{events = [SearchDuration_Finished] ,
				responses = [{replacement = clear state = agent_clearalertstate}]
			}
		]}
endscript
