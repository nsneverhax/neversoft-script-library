GuardPathBlockedAnimRepeatMinDelay = 10.0
GuardPathBlockedAnimRepeatMaxDelay = 15.0
GuardPrepare_MovementDesc = {
	id = GuardPrepare_MovementDesc
	movement = walk_fast
	stop_distance = 0.4
	arrival_distance = 0.6
	departure_distance = 2.0
	stopping_distance = 2.5
	starting_distance = 2.5
}
GuardLine_MovementDesc = {
	id = GuardLine_MovementDesc
	movement = run_fast
	stop_distance = 0.4
	arrival_distance = 0.5
	departure_distance = 0.6
	stopping_distance = 1.0
	starting_distance = 1.0
}
GuardReturn_MovementDesc = {
	id = GuardReturn_MovementDesc
	movement = walk_slow
	stop_distance = 0.4
	arrival_distance = 0.6
	departure_distance = 2.0
	stopping_distance = 2.5
	starting_distance = 2.5
}

script RegisterBehaviors_Guard 
	registerstate {
		name = Bv_GuardPedCommonDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = trample
						state = Bv_DetectTrampleDanger
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_Prepare
		transitions = [{conditions = [{name = Agent_IsCalmAndNotReacting}]
				responses = [{replacement = this
						state = Bv_GuardLine_ManageBoard
					}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_ManageBoard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = skateboard
						state = Bv_SkaterPed_HandleBoardTransition
					}]
			}
			{events = [ManageSkateboard_NothingToDo
					AcquireVehicle_Failed
					ReleaseVehicle_Failed
					AcquireVehicle_Finished
					ReleaseVehicle_Finished]
				responses = [{replacement = reaction
						state = Bv_SetReactionState_Scr
					}
					{replacement = this
						state = Bv_GuardLine
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine
		transitions = [{events = [enter_behavior]
				responses = [{replacement = aim
						state = Bv_AimAt_Target
					}
					{replacement = attack
						state = Bv_GuardLine_Attack
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_Attack
		task = {name = task_guardline
			params = {movement_desc = $GuardLine_MovementDesc
				offset_movement_desc = $GuardLine_MovementDesc}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = init
						state = GuardLine_Attack_Init
					}
					{replacement = detect_knockdown
						state = DetectEnemyKnockdown
					}]
			}
			{
				events = [Enemy_Knocked_Down]
				responses = [{replacement = this
						state = Bv_GuardLine_Attack_Hit
					}]
			}
			{
				conditions = [{name = agent_shouldmeleeattack}]
				responses = [{replacement = this
						state = Bv_GuardLine_Attack_Punch
					}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = this
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_Attack_Punch
		task = {name = Task_MeleeAttack
			params = {finished_event_id = MeleeAttack_Finished}
		}
		transitions = [{events = [shot_success]
				responses = [{replacement = punch
						state = KnockDownEnemy
						params = [{name = impact_type val = punch}]
					}
					{replacement = this
						state = Bv_GuardLine_Attack_Hit
					}]
			}
			{events = [MeleeAttack_Finished]
				responses = [{replacement = this
						state = Bv_GuardLine_Attack
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_Attack_Hit
		transitions = [{events = [enter_behavior]
				responses = [{replacement = vo
						state = playvoiceoverbyevent
						params = [{name = event_id val = ShakesFist}]
					}
					{replacement = anim
						state = Bv_PlayAnimSet
						params = [{name = anim_stage val = custom}
							{name = anim_set_id val = Human_Attack_Success}
							{name = blend_in_dur val = 0.2}
							{name = blend_out_dur val = 0.2}
							{name = sync_start_time val = false}
							{name = finished_event_id val = AttackSuccess_Anim_Finished}]
					}]
			}
			{events = [AttackSuccess_Anim_Finished]
				responses = [{replacement = this
						state = Bv_GuardLine_Attack
					}]
			}]
	}
	registerstate {
		name = Bv_GuardLine_Attack_Miss
		transitions = [{events = [enter_behavior]
				responses = [{replacement = anim
						state = Bv_PlayAnimSet
						params = [{name = anim_stage val = custom}
							{name = anim_set_id val = Human_Angry}
							{name = blend_in_dur val = 0.2}
							{name = blend_out_dur val = 0.2}
							{name = sync_start_time val = false}
							{name = finished_event_id val = Angry_Anim_Done}]
					}]
			}
			{events = [Angry_Anim_Done]
				responses = [{replacement = this
						state = Bv_GuardLine_Attack
					}]
			}]
	}
	registerstate {
		name = Bv_Guard_Prepare
		transitions = [{conditions = [{name = Agent_IsCalmAndNotReacting}]
				responses = [{replacement = this
						state = Bv_Guard_ManageBoard
					}]
			}
			{conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_Guard_ManageBoard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = skateboard
						state = Bv_SkaterPed_HandleBoardTransition
					}
				]
			}
			{events = [ManageSkateboard_NothingToDo
					AcquireVehicle_Failed
					ReleaseVehicle_Failed
					AcquireVehicle_Finished
					ReleaseVehicle_Finished]
				responses = [{replacement = reaction
						state = Bv_SetReactionState_Scr
					}
					{replacement = this
						state = Bv_Guard
						params = [{name = no_name ref = all_params}]
					}]
			}]
	}
	registerstate {
		name = Bv_Guard
		task = {name = task_guardprepare
			params = {movement_desc = $GuardPrepare_MovementDesc
				offset_movement_desc = $GuardPrepare_MovementDesc}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = look
						state = Bv_LookAt_Enemy
					}]
			}
			{conditions = [{name = agent_shouldguardgainattack}]
				responses = [{replacement = this
						state = Bv_Guard_InitAttack
					}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = this
						state = interact_clearcurnode
					}]
			}]
	}
	registerstate {
		name = Bv_Guard_InitAttack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GuardAttack_Init
					}
					{replacement = this
						state = Bv_GuardAttack
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect_knockdown
						state = DetectEnemyKnockdown
					}]
			}
			{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_GuardAttack_Approach
					}]
			}
			{
				events = [Enemy_Knocked_Down]
				responses = [{replacement = this
						state = Bv_GuardAttack_WaitForReaction_TargetFell
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_WaitForReaction_TargetFell
		transitions = [{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_GuardAttack_AttackSuccessAnim
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_Approach
		transitions = [{events = [enter_behavior]
				responses = [{replacement = approach
						state = GuardAttack_Approach
					}
					{replacement = react_state
						state = agent_pushreactionstate
						params = [{name = state val = angry}]
					}
					{replacement = vo_breath
						state = StartBreathLoop
					}
					{
						replacement = timer_vo
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedChaseInitVoMinDelay}
							{name = max_duration_secs val = $PedChaseInitVoMaxDelay}
							{name = event_id val = Play_Chase_Vo}]
					}
					{replacement = detect_knockdown
						state = DetectEnemyKnockdown
					}]
			}
			{
				events = [Play_Chase_Vo]
				recur = true
				responses = [{
						replacement = vo_chase
						state = playvoiceoverbyevent
						params = [{name = event_id val = Chase}
							{name = started_event_id val = Chase_Vo_Started}
							{name = finished_event_id val = Chase_Vo_Finished}]
					}
					{
						replacement = timer_vo
						state = Bv_Timer
						params = [{name = min_duration_secs val = $PedChaseVoRepeatMinDelay}
							{name = max_duration_secs val = $PedChaseVoRepeatMaxDelay}
							{name = event_id val = Play_Chase_Vo}]
					}]
			}
			{
				events = [Chase_Vo_Started]
				responses = [{replacement = vo_breath
						state = DuckDownBreathLoop
					}]
			}
			{
				events = [Chase_Vo_Finished]
				responses = [{replacement = vo_breath
						state = DuckUpBreathLoop
					}]
			}
			{
				conditions = [{name = GuardShouldPlayPathBlockedAnim
					}]
				responses = [{replacement = this
						state = Bv_GuardAttack_PathBlocked
					}]
			}
			{
				events = [Enemy_Knocked_Down]
				responses = [{replacement = this
						state = Bv_GuardAttack_AttackSuccessAnim
					}]
			}
			{
				events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_GuardAttack_FinishKnockdown
					}]
			}
			{
				conditions = [{name = agent_hasclearaim}]
				responses = [{replacement = this
						state = Bv_GuardAttack_Attack
					}]
			}
			{
				conditions = [{name = agent_shouldguardloseattack}]
				responses = [{replacement = cleanup
						state = GuardAttack_Exit
					}
					{replacement = this
						state = Bv_GuardAttack_LostAttackAnim
					}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = this
						state = interact_clearcurnode
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = vo_breath
						state = StopBreathLoop
					}
					{replacement = react_state
						state = agent_popreactionstate
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_PathBlocked
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GuardAttack_PathBlocked
					}
					{replacement = react_state
						state = agent_pushreactionstate
						params = [{name = state val = angry}]
					}]
			}
			{events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_GuardAttack_FinishKnockdown
					}]
			}
			{events = [Path_Blocked_Anim_Done]
				responses = [{replacement = this
						state = Bv_GuardAttack_Approach
					}]
			}
			{
				conditions = [{name = agent_shouldguardloseattack}]
				responses = [{replacement = cleanup
						state = GuardAttack_Exit
					}
					{replacement = this
						state = Bv_GuardAttack_LostAttackAnim
					}]
			}
			{conditions = [{name = interact_compareinteractstate
						params = {state = exiting}
					}]
				responses = [{replacement = this
						state = interact_clearcurnode
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = anim
						state = agent_finishcustomanim
					}
					{replacement = react_state
						state = agent_popreactionstate
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_Attack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = react_state
						state = agent_pushreactionstate
						params = [{name = state val = angry}]
					}
					{replacement = child
						state = GuardAttack_Attack
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = react_state
						state = agent_popreactionstate
					}]
			}
			{
				conditions = [{name = agent_shouldguardloseattack}]
				responses = [{replacement = this
						state = Bv_GuardAttack_LostAttackAnim
					}]
			}
			{
				conditions = [{name = GuardShouldPlayPathBlockedAnim
					}]
				responses = [{replacement = this
						state = Bv_GuardAttack_PathBlocked
					}]
			}
			{
				events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_GuardAttack_FinishKnockdown
					}]
			}
			{
				events = [Lunge_Missed
					Punch_Missed]
				responses = [{replacement = this
						state = Bv_GuardAttack
					}]
			}
			{
				events = [Attack_Success]
				responses = [{replacement = this
						state = Bv_GuardAttack_AttackSuccessAnim
					}]
			}
		]
	}
	registerstate {
		name = Bv_GuardAttack_LostAttackAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GuardAttack_LostAttackAnim
					}]
			}
			{
				events = [Lost_Attack_Anim_Done]
				responses = [{replacement = this
						state = Bv_GuardAttack_ReturnToGuard
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_ReturnToGuard
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_Guard_ReturnToInteraction
					}]
			}
			{
				events = [ReturnToInteraction_Finished]
				responses = [{replacement = this
						state = Bv_Guard
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_AttackSuccessAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GuardAttack_AttackSuccessAnim
					}]
			}
			{
				events = [Retry_Attack]
				responses = [{replacement = this
						state = Bv_GuardAttack
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_FinishKnockdown
		transitions = [{events = [Ragdoll_Knockdown_Done]
				responses = [{replacement = this
						state = Bv_GuardAttack_AttackFailAnim
					}]
			}]
	}
	registerstate {
		name = Bv_GuardAttack_AttackFailAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = GuardAttack_AttackFailAnim
					}]
			}
			{
				events = [Retry_Attack]
				responses = [{replacement = this
						state = Bv_GuardAttack
					}]
			}]
	}
endscript

script Bv_Guard_ReturnToInteraction 
	ai_giveorder \{name = bv_moveto_once_interact
		params = {
			movement_desc = $GuardReturn_MovementDesc
			offset_movement_desc = $GuardReturn_MovementDesc
		}}
	ai_giveorder \{replacement = child2
		name = Bv_Guard_Control_Look}
	blockuntilevent \{type = MoveTo_Finished}
	eventcache_add \{event_id = ReturnToInteraction_Finished}
endscript

script Bv_Guard_Control_Look 
	begin
	ai_giveorder {name = Bv_GenEvents_Distance params = {less_than = Distance_LookEnemy
			greater_than = Distance_Unused
			distance = 3
			interest_type_id = enemy}}
	ai_giveorder {replacement = look name = Bv_LookAt_Interact}
	blockuntilevent type = Distance_LookEnemy
	ai_giveorder {name = Bv_GenEvents_Distance params = {less_than = Distance_Unused
			greater_than = Distance_IgnoreEnemy
			distance = 4.5
			interest_type_id = enemy}}
	ai_giveorder {replacement = look name = Bv_LookAt_Enemy}
	ai_giveorder {replacement = timer name = Bv_GenEvents_Timer params = {event_id = LookAtEnemy_Expired time = 2}}
	wait 3 seconds
	blockuntilevent anytypes = [Distance_IgnoreEnemy LookAtEnemy_Expired]
	switch <type>
		case LookAtEnemy_Expired
		break
	endswitch
	repeat
endscript

script GuardAttack_Init 
	change NumAngryChaseBehaviorPeds = ($NumAngryChaseBehaviorPeds + 1)
	Interest_GetEnemy
	if NOT gotparam enemy
		agent_setinterest {interest_type_id = enemy object_id = player1 acquire_vis_loc = false}
		enemy = player1
	endif
	agent_setinterest {interest_type_id = target object_id = <enemy> acquire_vis_loc = false}
	GetCOIMPriority
	settags coim_priority = <coimpriority>
	SetCOIMPriority priority = $coim_priority_permanent
	obj_suspendenable on = 0
	locator_gettraveler
	if NOT (<traveler> = TERRAIN_AREA1)
		locator_settraveler traveler = terrain_ped_urgent
	endif
	Navigation_DisableAvoidance
endscript

script GuardAttack_Exit 
	Navigation_EnableAvoidance
	eventcache_add \{event_id = Close_GuardAttack_Viewport}
	locator_gettraveler
	if NOT (<traveler> = TERRAIN_AREA1)
		locator_settraveler \{traveler = terrain_ped_trivial}
	endif
	getsingletag \{coim_priority}
	SetCOIMPriority priority = <coim_priority>
	obj_suspendenable \{on = 1}
	change NumAngryChaseBehaviorPeds = ($NumAngryChaseBehaviorPeds - 1)
endscript

script GuardAttack_Approach 
	ai_giveorder replacement = reload name = Bv_EnableItemControlReload
	ai_giveorder replacement = lookat name = Bv_LookAt_Enemy
	looking_at_enemy = true
	ai_giveorder {replacement = move
		name = Bv_MoveToWithOffset_Loop
		params = {movement_desc = {$guard_move}
			offset_movement_desc = {$guard_offset_move}
			interest_type_id = enemy
			relative_offset_type = movement
			relative_offset = (0.0, 0.0, 0.0)
			finished_event_id = MoveTo_Finished
			intercept = true}}
	ai_giveorder replacement = equip name = EquipVelocitySpecificWeapon
	begin
	wait 0.5 seconds
	obj_getid
	Interest_GetEnemy
	getdistance objecta = <enemy> objectb = <objid>
	if Navigation_HasStraightPathToDestination
		if NOT (<looking_at_enemy> = true)
			ai_giveorder replacement = lookat name = Bv_LookAt_Enemy
			<looking_at_enemy> = true
		endif
	else
		if (<looking_at_enemy> = true)
			ai_giveorder replacement = lookat name = null
			<looking_at_enemy> = false
		endif
	endif
	repeat
endscript

script GuardAttack_PathBlocked 
	getstarttime
	settags last_guard_path_blocked_anim = <starttime>
	ai_giveorder \{replacement = lookat
		name = Bv_LookAt_Enemy}
	playvoiceoverbyevent \{event_id = GuardWarning}
	ai_giveorder \{replacement = anim
		name = Bv_PlayAnimSet
		params = {
			anim_stage = custom
			anim_set_id = Human_Angry
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Path_Blocked_Anim_Done
		}}
endscript

script GuardAttack_Attack 
	Navigation_GetMaxTurnSpeed
	Navigation_GetRotAccel
	settags default_max_turn_speed = <max_turn_speed> default_rot_accel = <rot_accel>
	onexitrun GuardAttack_Attack_Exit
	getsingletag fist_equipped
	if (<fist_equipped> = true)
		ai_giveorder replacement = aim name = Bv_AimAt_Target
		Navigation_SetMaxTurnSpeed max_turn_speed = 600
		Navigation_SetRotAccel rot_accel = 10000000
		ai_giveorder {replacement = move
			name = Bv_MoveTo_Loop_Enemy
			params = {movement_desc = $Skate_Combat_Melee_MovementDesc}}
		ai_giveorder {replacement = spin
			name = bv_setmovedesc
			params = {movement_desc = {shuffle = false force_align = true}
				offset_movement_desc = {shuffle = false force_align = true}
				movement_desc_stage = action}}
		ai_giveorder {replacement = punch
			name = Bv_MeleeAttack_Loop}
		playvoiceoverbyevent event_id = attack
	else
		eventcache_add event_id = cam_event_angry_attack
		ai_giveorder {replacement = lunge
			name = Bv_Lunge
			params = {offset_dist = 0.75
				offset_dist_to_speed_ratio = $PedChaseOffsetDistToSpeedRatio
				movement_desc = $Skate_Combat_Melee_MovementDesc
				collision_buffer_dist = 0.0
				max_angle_correction = $PedLungeMaxAngleCorrection}}
		ai_giveorder {replacement = anim
			name = Bv_CustomAnim
			params = {anim = Dive_Attack
				blend_period = 0.2
				custom_finished_event_id = Lunge_Anim_Finished}}
		playvoiceoverbyevent event_id = Tackle
		ai_giveorder {replacement = timer_disable_lunge_knockdown
			name = Bv_Timer
			params = {min_duration_secs = $PedDiveAttackKnockdownSecs
				max_duration_secs = $PedDiveAttackKnockdownSecs
				event_id = Disable_Lunge_Knockdown}}
		ai_giveorder {replacement = timer_get_up_spin
			name = Bv_Timer
			params = {min_duration_secs = 2.0
				max_duration_secs = 2.0
				event_id = Start_Get_Up_Spin}}
	endif
	Attack_Success = false
	lunge_knockdown_enabled = true
	begin
	blockuntilevent anytypes = [lunge_collision Lunge_Anim_Finished shot_success MeleeAttack_Finished Disable_Lunge_Knockdown Start_Get_Up_Spin]
	switch <type>
		case lunge_collision
		if (<lunge_knockdown_enabled> = true)
			KnockDownEnemy impact_type = lunge
			<Attack_Success> = true
		endif
		case shot_success
		KnockDownEnemy impact_type = punch
		<Attack_Success> = true
		case Lunge_Anim_Finished
		if (<Attack_Success> = true)
			eventcache_add event_id = Attack_Success
		else
			eventcache_add event_id = Lunge_Missed
		endif
		case MeleeAttack_Finished
		ai_giveorder replacement = aim name = null
		if (<Attack_Success> = true)
			eventcache_add event_id = Attack_Success
		else
			eventcache_add event_id = Punch_Missed
		endif
		case Disable_Lunge_Knockdown
		<lunge_knockdown_enabled> = false
		case Start_Get_Up_Spin
		ai_giveorder replacement = aim name = Bv_LookAt_Enemy
		ai_giveorder replacement = lunge name = null
		ai_giveorder replacement = spin name = bv_setmovedesc params = {movement_desc = {shuffle = false} , movement_desc_stage = action}
	endswitch
	repeat
endscript

script GuardAttack_Attack_Exit 
	getsingletag \{default_max_turn_speed}
	getsingletag \{default_rot_accel}
	Navigation_SetMaxTurnSpeed max_turn_speed = <default_max_turn_speed>
	Navigation_SetRotAccel rot_accel = <default_rot_accel>
endscript

script GuardAttack_AttackSuccessAnim 
	Attack_PerformAttackSuccessAnim \{finished_event_id = Retry_Attack}
endscript

script GuardAttack_AttackFailAnim 
	ai_giveorder \{replacement = lookat
		name = Bv_LookAt_Enemy}
	ai_giveorder \{replacement = anim
		name = Bv_PlayAnimSet
		params = {
			anim_stage = custom
			anim_set_id = Human_Angry
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Retry_Attack
		}}
endscript

script GuardAttack_LostAttackAnim 
	ai_giveorder \{replacement = lookat
		name = Bv_LookAt_Enemy}
	playvoiceoverbyevent \{event_id = GuardTaunt}
	ai_giveorder \{replacement = anim
		name = Bv_PlayAnimSet
		params = {
			anim_stage = custom
			anim_set_id = Human_Lost_Attack
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = Lost_Attack_Anim_Done
		}}
endscript

script GuardShouldPlayPathBlockedAnim 
	if Navigation_CompareTraversalState state = finished_at_blockage
		if NOT getsingletag last_guard_path_blocked_anim
			getrandomvalue name = delay a = $GuardPathBlockedAnimRepeatMinDelay b = $GuardPathBlockedAnimRepeatMaxDelay float
			settags guard_path_blocked_anim_repeat_delay = <delay>
			return true
		else
			getsingletag guard_path_blocked_anim_repeat_delay
			getrandomvalue name = new_delay a = $GuardPathBlockedAnimRepeatMinDelay b = $GuardPathBlockedAnimRepeatMaxDelay float
			settags guard_path_blocked_anim_repeat_delay = <new_delay>
			getelapsedtime starttime = <last_guard_path_blocked_anim>
			if (<elapsedtime> > (<guard_path_blocked_anim_repeat_delay> * 1000))
				return true
			else
				return false
			endif
		endif
	endif
	return false
endscript

script CreateGuardAttackViewport 
	if gman_hasactivegoals
		return
	endif
	goal_viewport_kill goal_string = 'AngryChase'
	obj_getid
	goal_viewport_create {
		goal_string = 'AngryChase'
		controlscript = GuardAttackCam
		vport_pos = (516.0, 70.0)
		vport_scale = (0.3 * (16.0, 9.0))
		viewport_style = viewport_element
		near_clip = 0.1
		far_clip = 75.0
		fov = 72
		skater_visible = 1
		tags = {chase_obj_id = <objid> fall_cam = <fall_cam>}
		appearance_priority = 2
		play_hold = 0
	}
endscript

script GuardAttackCam 
	goal_viewport_parent :getsingletag chase_obj_id
	goal_viewport_parent :domorph alpha = 0
	ccam_domorph {
		lockto = <chase_obj_id>
		locktobone = control_root
		lookat = <chase_obj_id>
		lookatbone = bone_head
		pos = (2.7, -2.3, 0.16)
		quat = (-0.31381503, -0.592021, -0.38649803)
		fov = 70.0
	}
	ccam_domorph {
		lockto = <chase_obj_id>
		locktobone = control_root
		pos = (1.7, -1.2, 0.25)
		quat = (-0.31381503, -0.592021, -0.38649803)
		lookat = <chase_obj_id>
		lookatbone = bone_head
		fov = 60.0
		time = 0.7
		motion = ease_in
	}
	goal_viewport_parent :domorph alpha = 1 time = 0.6
	ccam_waitmorph
	ccam_domorph {
		lockto = <chase_obj_id>
		locktobone = control_root
		pos = (1.6, -1.2, 0.25)
		quat = (-0.50279, -0.519418, -0.47983402)
		lookat = skater
		lookatpos = (0.0, 1.4, 0.0)
		fov = 55.0
		time = 2.0
		motion = smooth
	}
	<chase_obj_id> :blockuntilevent anytypes = [Close_GuardAttack_Viewport]
	switch <type>
		case cam_event_angry_attack
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.5, 1.6, 1.7)
			quat = (-0.50279, -0.519418, -0.47983402)
			lookat = <chase_obj_id>
			lookatpos = (0.0, 0.1, 0.0)
			fov = 55.0
			time = 1.0
		}
		ccam_waitmorph
		wait 1 second
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.7, 1.134594, -0.150738)
			quat = (0.52241, 0.48684004, -0.513358)
			lookat = <chase_obj_id>
			lookatbone = bone_head
			fov = 55.0
			time = 2.0
		}
		ccam_waitmorph
		default
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.7, 1.634594, -0.150738)
			quat = (0.52241, 0.48684004, -0.513358)
			lookat = <chase_obj_id>
			lookatbone = bone_head
			fov = 55.0
		}
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.7, 1.134594, -0.150738)
			quat = (0.52241, 0.48684004, -0.513358)
			lookat = <chase_obj_id>
			lookatbone = bone_head
			fov = 55.0
			time = 1.0
		}
		ccam_waitmorph
	endswitch
	wait 2.5 seconds
	goal_viewport_parent :domorph alpha = 0 time = 0.7
endscript

script GuardLine_Attack_Init 
	inventory_selectiteminslot \{item_slot_id = fist}
	inventory_equipiteminstant \{equip_slot_id = left_hand}
endscript

script DetectEnemyKnockdown 
	Interest_GetEnemy
	if NOT gotparam \{enemy}
		eventcache_add \{event_id = Enemy_Knocked_Down}
		return
	endif
	if ObjectIsPlayer <enemy>
		<enemy> :blockuntilevent anytypes = [Knocked_Down_By_Attack skaterbailed]
	else
		<enemy> :blockuntilevent anytypes = [Knocked_Down_By_Attack]
	endif
	eventcache_add \{event_id = Enemy_Knocked_Down}
endscript
