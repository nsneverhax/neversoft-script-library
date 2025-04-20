
script RegisterBehaviors_MovementMode 
	registerstate {
		name = bv_stand
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = {mode = stand}}}
		transitions = []}
	registerstate {
		name = Bv_StandIdle
		task = {name = Task_UnequipItems}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this state = bv_stand}]
			}]
	}
	registerstate {
		name = Bv_Crouch
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = {mode = crouch}}}
		transitions = []}
endscript

script Bv_Cower 
	ai_giveorder \{name = Bv_CustomAnim
		params = {
			anim = Ped_Male_Cower
			cycle
		}}
	block
endscript
