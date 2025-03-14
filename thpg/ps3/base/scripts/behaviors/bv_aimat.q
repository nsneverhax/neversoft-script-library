
script RegisterBehaviors_AimAt 
	registerstate {
		name = Bv_AimAt_Target
		task = {name = Task_AimAt params = {interest_type_id = target}}
		transitions = []}
	registerstate {
		name = Bv_AimAt_Investigate
		task = {name = Task_AimAt params = {interest_type_id = investigate}}
		transitions = []}
	registerstate {
		name = Bv_AimAt_Danger
		task = {name = Task_AimAt params = {interest_type_id = danger}}
		transitions = []}
	registerstate {
		name = Bv_AimAt_Location
		task = {name = Task_AimAt params = {interest_type_id = location}}
		transitions = []}
	registerstate {
		name = Bv_AimAt_Enemy
		task = {name = Task_AimAt params = {interest_type_id = enemy}}
		transitions = []}
	registerstate {
		name = Bv_AimAt_Center
		task = {name = Task_AimAt params = {interest_type_id = center}}
		transitions = []}
	registerstate {
		name = Bv_Stand_AimAt_Danger
		task = {name = Task_AimAt params = {interest_type_id = danger}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = stand state = bv_stand}]
			}]}
	registerstate {
		name = Bv_AimAt_Target_Equip_Primary
		task = {name = Task_AimAt params = {interest_type_id = target}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = primaryweapon}]
					}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = reload state = Bv_EnableItemControlReload}]
			}
		]}
endscript

script Bv_Aim \{hierarchy = logic}
	cmd_legacy
	printf \{"USE BEHAVIOR_AIMAT"}
	if gotparam \{enemy}
		<object> = <enemy>
	endif
	if gotparam \{object}
		agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = this
		state = Bv_AimAt_Target_Equip_Primary}
endscript

script Bv_AimAt 
	if gotparam \{object}
		<enemy> = <object>
	else
		if gotparam \{node}
			<enemy> = <node>
		endif
	endif
	Interest_SetDanger danger = <enemy>
	ai_giveorder \{replacement = aim
		name = Bv_AimAt_Danger}
	block
endscript
