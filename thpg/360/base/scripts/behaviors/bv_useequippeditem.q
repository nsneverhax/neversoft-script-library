
script RegisterBehaviors_UseEquippedItem_Once 
	registerstate \{name = Bv_UseEquippedItem_Once
		task = {
			name = Task_UseItem
			params = {
				num_uses = 1
			}
		}
		transitions = [
		]}
endscript

script RegisterBehaviors_UseEquippedItem_Loop 
	registerstate \{name = Bv_UseEquippedItem_Loop
		task = {
			name = Task_ItemControlUse
		}
		transitions = [
		]}
endscript

script RegisterBehaviors_AutoUseEquippedItem_Loop 
	registerstate {
		name = Bv_AutoUseEquippedItem_Loop
		transitions =
		[
			{
				conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_AutoUseEquippedItem_Loop_GotAim}]
			}
		]
	}
	registerstate {
		name = Bv_AutoUseEquippedItem_Loop_GotAim
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = use state = Bv_UseEquippedItem_Loop}]
			}
			{
				conditions = [{name = agent_hasclearaim result = false}]
				responses = [{replacement = this state = Bv_AutoUseEquippedItem_Loop_LostAim}]
			}
		]
	}
	registerstate {
		name = Bv_AutoUseEquippedItem_Loop_LostAim
		task =
		{
			name = Task_DetectStopItemUse
			params = {stop_event_id = DetectStopItemUse_Stop}
		}
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = use state = Bv_UseEquippedItem_Loop}
					{replacement = timer state = Bv_DetectStopItemUse_Timer}]
			}
			{
				conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_AutoUseEquippedItem_Loop_GotAim}]
			}
			{
				events = [DetectStopItemUse_Stop
					DetectStopItemUse_Timer_Finished] ,
				responses = [{replacement = this state = Bv_AutoUseEquippedItem_Loop}]
			}
		]
	}
	registerstate {
		name = Bv_DetectStopItemUse_Timer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 1
				max_duration_secs = 3
				event_id = DetectStopItemUse_Timer_Finished}}
		transitions = []}
endscript
