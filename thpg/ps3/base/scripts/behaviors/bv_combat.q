MoveToLocationCombat_MovementDesc = {
	id = MoveToLocationCombat_MovementDesc
	movement = run_fast
	stop_distance = 0.5
	arrival_distance = 0.75
	departure_distance = 0.75
	point_arrival_distance = 0.75
	stopping_distance = 0.5
	starting_distance = 0.5
	outside_boundary = arrive
	path_find = shortest
	strafe = true
	speeds = $ped_speeds
}

script RegisterBehaviors_Combat_Simple 
	registerstate {
		name = Bv_SimpleCombat_EquippedItem
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = items state = Bv_ManageEquippedItem}]}
		]}
	registerstate {
		name = Bv_SimpleCombat_AllItems
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = items state = Bv_ManageAllItems}]}
		]}
	registerstate {
		name = Bv_SimpleAimCombat_EquippedItem
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = combat state = Bv_SimpleCombat_EquippedItem}
					{replacement = look state = Bv_AimAt_Target}]}
		]}
	registerstate {
		name = Bv_SimpleAimCombat_AllItems
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = combat state = Bv_SimpleCombat_AllItems}
					{replacement = look state = Bv_AimAt_Target}]}
		]}
endscript

script RegisterBehaviors_Combat_MoveToLocation 
	registerstate {
		name = Bv_MoveToLocationCombat
		task = {name = task_runscript
			params = {script_name = Navigation_SetMoveDescription
				script_params = MoveToLocationCombat_MovementDesc}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events state = Bv_GenEvents_EquippedItem_Type}
					{replacement = equip state = Bv_EnableItemControlEquip}]}
			{events = [equipped_meleeweapon
					equipped_secondaryweapon] ,
				responses = [{replacement = combat state = Bv_MoveToLocationCombat_Move}]}
			{events = [equipped_primaryweapon] ,
				responses = [{replacement = combat state = Bv_MoveToLocationCombat_CombatMove}]}
			{events = [MoveToLocationCombat_Finished] ,
				responses = [{replacement = this state = Bv_FreeCombat_EquippedItem}]}
		]}
	registerstate {
		name = Bv_MoveToLocationCombat_Move
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move state = bv_moveto_loop_location}]}
			{events = [MoveTo_Finished]
				responses = [{replacement = this state = Bv_MoveToLocationCombat_Finshed}]}
		]}
	registerstate {
		name = Bv_MoveToLocationCombat_CombatMove
		transitions = [{events = [enter_behavior]
				responses = [{replacement = combat state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = bv_moveto_loop_location}]}
			{events = [MoveTo_Finished]
				responses = [{replacement = this state = Bv_MoveToLocationCombat_Finshed}]}
		]}
	registerstate {
		name = Bv_MoveToLocationCombat_Finshed
		task = {name = task_runscript
			params = {script_name = eventcache_add
				script_params = {event_id = MoveToLocationCombat_Finished}}}
		transitions = []}
endscript

script RegisterBehaviors_Combat_Detect 
	registerstate {
		name = Bv_DetectThreatsAndGenEvents
		transitions = [{events = [enter_behavior]
				responses = [{replacement = events state = Bv_GenEvents_Interest_Enemy}
					{replacement = detect_vis state = Bv_DetectThreats}
					{replacement = help state = Bv_ManageRequestHelp}
					{replacement = assistance state = Bv_ManageRequestAssistance}
				]
			}
		]
	}
	registerstate {
		name = Bv_DetectCombat
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_DetectThreatsAndGenEvents}
					{replacement = equip state = Bv_EnableItemControlEquip}]}
			{events = [got_interest_enemy] ,
				responses = [{replacement = combat state = Bv_FreeCombat_EquippedItem}]}
			{events = [lost_interest_enemy] ,
				responses = [{replacement = combat state = bv_blank}]}
		]}
	registerstate {
		name = Bv_DetectAcquireVehicleCombat
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_DetectThreatsAndGenEvents}]}
			{events = [got_interest_enemy] ,
				responses = [{replacement = combat state = Bv_AcquireVehicleCombat}]}
			{events = [lost_interest_enemy] ,
				responses = [{replacement = combat state = Bv_EnableItemControlEquip}]}
		]}
	registerstate {
		name = Bv_PatrolDetectCombat
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_DetectThreatsAndGenEvents}
					{replacement = equip state = Bv_EnableItemControlEquip}]}
			{events = [got_interest_enemy] ,
				responses = [{replacement = move state = Bv_FreeCombat_EquippedItem}]}
			{events = [lost_interest_enemy] ,
				responses = [{replacement = move
						state = Bv_FollowPath
						params = [{name = waypoint ref = waypoint}]}
				]}
		]}
	registerstate {
		name = Bv_DetectSimpleAimCombat_AllItems
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_DetectThreatsAndGenEvents}]}
			{events = [got_interest_enemy] ,
				responses = [{replacement = combat state = Bv_SimpleAimCombat_AllItems}]}
			{events = [lost_interest_enemy] ,
				responses = [{replacement = combat state = Bv_EnableItemControlEquip}]}
		]}
	registerstate {
		name = Bv_FollowDetectCombat
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_DetectThreatsAndGenEvents}
					{replacement = equip state = Bv_EnableItemControlEquip}]}
			{events = [got_interest_enemy] ,
				responses = [{replacement = move state = Bv_FreeCombat_EquippedItem}]}
			{events = [lost_interest_enemy] ,
				responses = [{replacement = move
						state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`
						params = [{name = relative_offset_type ref = relative_offset_type}
							{name = relative_offset_type val = world}
							{name = relative_offset ref = relative_offset}
							{name = relative_offset val = (0.0, 0.0, 0.0)}
						]}
				]}
		]}
endscript

script RegisterBehaviors_Combat 
	registerstate {
		name = Bv_GenEvents_ShouldProximityAttack
		task = {name = Task_GenEvents params = {event_gen_id = shouldproximityattack}}
		transitions = []}
	registerstate {
		name = Bv_ProximityAttack
		task = {name = task_runscript params = {script_name = agent_giveandequipproximityattackitem}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = this state = Bv_ProximityAttack_Attack}]}
		]}
	registerstate {
		name = Bv_ProximityAttack_Attack
		task = {name = Task_MeleeAttack
			params = {finished_event_id = ProximityAttack_Finished}}
		transitions = []}
	registerstate {
		name = Bv_GenEvents_CombatDist
		task = {name = Task_GenEvents params = {event_gen_id = combatdist}}
		transitions = []}
	registerstate {
		name = Bv_GenEvents_CombatDist
		task = {name = Task_GenEvents params = {event_gen_id = combatdist}}
		transitions = []}
	registerstate {
		name = Bv_AcquireVehicleCombat
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = combat state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = Bv_AcquireVehicle}
				]}
			{events = [AcquireVehicle_Finished] ,
				responses = [{replacement = this state = Bv_FreeCombat_AllItems}
				]}
		]}
endscript

script RegisterBehaviors_FreeCombat 
	registerstate {
		name = Bv_FreeCombat_AllItems
		task = {name = Task_ItemControlMovement}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = combat state = Bv_FreeCombat_EquippedItem}]}
		]}
	registerstate {
		name = Bv_FreeCombat_EquippedItem
		task = {name = Task_ItemControlMovement}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = events state = Bv_GenEvents_EquippedItem_Type}]}
			{events = [equipped_meleeweapon] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Melee}]}
			{events = [equipped_primaryweapon] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Gun}]}
			{events = [equipped_secondaryweapon] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Bow}]}
			{events = [equipped_none] ,
				responses = [{replacement = combat state = Bv_FreeCombat_None}]}
		]}
	registerstate {
		name = Bv_FreeCombat_None
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vehicle state = Bv_GenEvents_VehicleType}
					{replacement = vision state = Bv_EnableVision}]}
			{events = [vehicletype_none
					vehicletype_item] ,
				responses = [{replacement = combat state = bv_blank}]}
			{events = [vehicletype_horse] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Rider_None}]}
			{events = [vehicletype_human] ,
				responses = [{replacement = combat state = bv_blank}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Rider_None
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = dist state = Bv_GenEvents_CombatDist}
					{replacement = child state = Bv_Evasion_Rider}]}
			{events = [got_combatdist_toofar_center] ,
				responses = [{replacement = this state = Bv_FreeCombat_Rider_None_MoveTo_Center}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Rider_None_MoveTo_Center
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = dist state = Bv_GenEvents_CombatDist}
					{replacement = move state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`}]}
			{events = [lost_combatdist_toofar_center] ,
				responses = [{replacement = this state = Bv_FreeCombat_Rider_None}]}
		]}
endscript

script Bv_AutoFire \{hierarchy = logic}
	if gotparam \{enemy}
		<object> = <enemy>
	endif
	if gotparam \{object}
		agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = this
		state = Bv_SimpleAimCombat_AllItems}
endscript

script RegisterBehaviors_VehicleCombat 
	registerstate {
		name = Bv_VehicleCombat_CrouchCover
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 2
				max_duration_secs = 8
				event_id = CrouchCover_TimedOut}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = crouch state = Bv_Crouch}
					{replacement = aim state = Bv_AimAt_Target}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = reload state = Bv_EnableItemControlReload}]}
			{events = [CrouchCover_TimedOut] ,
				responses = [{replacement = this state = Bv_VehicleCombat_CrouchCover_Shoot}]}
		]}
	registerstate {
		name = Bv_VehicleCombat_CrouchCover_Shoot
		task = {name = Task_GenEvents_NumUses
			params = {min_num_uses = 1
				max_num_uses = 2
				event_id = CrouchCover_Shoot_Finished}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = stand state = bv_stand}
					{replacement = shoot state = Bv_SimpleAimCombat_AllItems}
					{replacement = uses state = Bv_GenEvents_LoadedUses}]}
			{events = [CrouchCover_Shoot_Finished
					lost_loadeduses] ,
				responses = [{replacement = this state = Bv_VehicleCombat_CrouchCover}]}
		]}
endscript
