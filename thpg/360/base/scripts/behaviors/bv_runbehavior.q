
script registerbehaviors_runbehavior 
	registerstate {
		name = bv_runbehavior
		task = {name = task_runbehavior}
	}
	registerstate {
		name = bv_runlife
		task = {name = Task_RunLifeBehavior}
	}
	registerstate {
		name = bv_runlogic
		task = {name = Task_RunLogicBehavior}
	}
	registerstate {
		name = Bv_RunLifeWithItems
		task = {name = Task_RunLifeBehavior}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = equip
						state = Bv_EnableItemControlEquip}
					{replacement = reload
						state = Bv_EnableItemControlReload}
				]}
		]
	}
endscript
