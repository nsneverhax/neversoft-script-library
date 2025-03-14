
script CombatMeleeShouldCheer 
	getrandomvalue \{name = rand_int
		a = 1
		b = 100
		integer}
	if (<rand_int> > 75)
		return \{true}
	endif
	return \{false}
endscript

script RegisterBehaviors_Combat_Melee 
	registerstate {
		name = Bv_FreeCombat_Melee
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vehicle state = Bv_GenEvents_VehicleType}
					{replacement = vision state = Bv_EnableVision}]}
			{events = [vehicletype_none
					vehicletype_item] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Ground_Melee}]}
			{events = [vehicletype_horse] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Rider_Melee}]}
			{events = [vehicletype_human] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Ground_Melee}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Ground_Melee
		task = {name = Task_ClearCenterOnMelee}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vision state = Bv_EnableVision}
					{replacement = stand state = bv_stand}
					{replacement = move state = Bv_FreeCombat_Ground_Melee_Move}
					{replacement = aim state = Bv_AimAt_Target}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Rider_Melee
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = dist state = Bv_GenEvents_CombatDist}
					{replacement = child state = Bv_Evasion_Rider}]}
			{events = [got_combatdist_toofar_center] ,
				responses = [{replacement = this state = Bv_FreeCombat_Rider_Melee_MoveTo_Center}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Rider_Melee_MoveTo_Center
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = dist state = Bv_GenEvents_CombatDist}
					{replacement = move state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`}]}
			{events = [lost_combatdist_toofar_center] ,
				responses = [{replacement = this state = Bv_FreeCombat_Rider_Melee}]}
		]}
endscript

script RegisterBehaviors_Combat_Ground_Melee 
	registerstate {
		name = Bv_MeleeAttack_Loop
		transitions = [{conditions = [{name = agent_shouldmeleeattack}]
				responses = [{replacement = this state = Bv_MeleeAttack_Loop_Attack}]}
		]}
	registerstate {
		name = Bv_MeleeAttack_Loop_Attack
		task = {name = Task_MeleeAttack
			params = {finished_event_id = MeleeAttack_Finished disable_slide}}
		transitions = [{events = [MeleeAttack_Finished] ,
				responses = [{replacement = this state = Bv_MeleeAttack_Loop_Delay}]}
		]}
	registerstate {
		name = Bv_MeleeAttack_Loop_Delay
		transitions = [{events = [enter_behavior]
				responses = [{replacement = this state = eventcache_add params = [{name = event_id val = Restart_Loop}]}]}
			{events = [Restart_Loop]
				responses = [{replacement = this state = Bv_MeleeAttack_Loop}]}
		]
	}
	registerstate {
		name = Bv_FreeCombat_Ground_Melee_Move
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = combat state = Bv_FreeCombat_Ground_Melee_Attack}
					{replacement = vision state = Bv_EnableVision}]}
			{events = [shot_success] ,
				conditions = [{name = CombatMeleeShouldCheer}]
				recur = true
				responses = [{replacement = combat state = Bv_FreeCombat_Ground_Melee_Cheer}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Ground_Melee_Cheer
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = anim
						state = Bv_PlayAnimSet
						params = [{name = anim_set_id val = Human_Taunt}
							{name = anim_stage val = custom}
							{name = sync_start_time val = false}
							{name = finished_event_id val = TauntAnim_Finished}
						]}
					{replacement = aim
						state = Bv_AimAt_Target}]
			}
			{events = [TauntAnim_Finished] ,
				responses = [{replacement = this state = Bv_FreeCombat_Ground_Melee_Attack}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Ground_Melee_Attack
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = reload state = Bv_EnableItemControlReload}
					{replacement = move state = Bv_MoveTo_Loop_Enemy}]}
			{conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_FreeCombat_Ground_Melee_Attack_ClearAim}]}
		]}
	registerstate {
		name = Bv_FreeCombat_Ground_Melee_Attack_ClearAim
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = reload state = Bv_EnableItemControlReload}
					{replacement = move state = Bv_MoveTo_Loop_Enemy}
					{replacement = use state = Bv_MeleeAttack_Loop}]}
			{conditions = [{name = agent_hasclearaim result = false}]
				responses = [{replacement = this state = Bv_FreeCombat_Ground_Melee_Attack}]}
		]}
endscript
