PedAngeredStokensGained = 1
PedAttackStokensLost = 5
PedAngryChaseCloseDist = 13.0
PedAngryChaseTooFarDist = 80.0
PedAngryChaseTooFarPathDist = 70.0
PedChaseInitVoMinDelay = 4.0
PedChaseInitVoMaxDelay = 5.0
PedChaseVoRepeatMinDelay = 4.0
PedChaseVoRepeatMaxDelay = 6.0
PedLungeKnockdownSpeed = 10.0
PedDiveAttackKnockdownSecs = 0.4
minspeedtocancellungeattack = 5.0
maxangletocancellungeattack = 30.0
incomboangermultiplier = 0.5
KnockdownToStokenDisplayDelay = 0.5
PedChaseOffsetDistToSpeedRatio = 0.4
PedLungeMaxAngleCorrection = 30.0
skate_melee_rot_accel = 5000.0
Skate_Combat_Melee_MovementDesc = {
	id = Skate_Combat_Melee_MovementDesc
	movement = run_fast
	outside_boundary = arrive
	path_find = shortest
	mode = stand
	stop_distance = 0.0
	arrival_distance = 0.0
	departure_distance = 1.5
	point_arrival_distance = 1.0
	stopping_distance = 0.0
	starting_distance = 0.75
	max_head_hor_rot = 0.0
	speeds = skate_ped_speeds_melee
	turn_speeds = skate_ped_turn_speeds_melee
	speed_change_angles = skate_ped_speed_change_angles_melee
	lin_accel = $default_lin_accel
	rot_accel = $skate_melee_rot_accel
}
NumAngryChaseBehaviorPeds = 0
cheatangrypeds = 0

script RegisterBehaviors_SkateAngry 
	registerstate {
		name = Bv_HandleEmotions
		task = {name = task_handleemotions}
	}
	registerstate {
		name = Bv_AngryAnnoyed
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = global
						state = AngryAnnoyed_Global
					}
					{
						replacement = state
						state = Bv_AngryAnnoyed_RecoverFromBump
					}]
			}]
	}
	registerstate {
		name = Bv_AngryAnnoyed_RecoverFromBump
		transitions = [{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_AngryAnnoyed_FaceEnemy
					}]
			}]
	}
	registerstate {
		name = Bv_AngryAnnoyed_FaceEnemy
		transitions = [{events = [enter_behavior]
				responses = [{replacement = force_align
						state = bv_setmovedesc
						params = [{name = movement_desc val = {force_align = true}}
							{name = movement_desc_stage val = action}]
					}
					{replacement = lookat_enemy
						state = Bv_AimAt_Enemy
						params = [{name = finished_event_id val = Is_Facing_Enemy}]
					}]
			}
			{
				events = [Is_Facing_Enemy]
				responses = [{replacement = this
						state = Bv_AngryAnnoyed_AngryAnim
					}]
			}]
	}
	registerstate {
		name = Bv_AngryAnnoyed_AngryAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = look_at_enemy
						state = Bv_LookAt_Enemy
					}
					{replacement = anim
						state = Bv_PlayAnimSet
						params = [{name = anim_stage val = custom}
							{name = anim_set_id val = Human_Annoyed}
							{name = blend_in_dur val = 0.2}
							{name = blend_out_dur val = 0.2}
							{name = sync_start_time val = false}
							{name = finished_event_id val = Annoyed_Anim_Done}]
					}]
			}
			{
				events = [Annoyed_Anim_Done]
				responses = [{
						replacement = event_force_calm_down
						state = eventcache_add
						params = [{name = event_id val = force_calm_down}]
					}
					{replacement = remove_threat
						state = agent_removethreat
					}
					{replacement = clear_interest
						state = agent_clearinterest
						params = [{name = interest_type_id val = enemy}]
					}
					{replacement = event_angry_annoyed_done
						state = eventcache_add
						params = [{name = event_id val = Angry_Annoyed_Done}]
					}]
			}
			{
				events = [bumped_small
					bumped_big
					bumped_knockdown
					ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_AngryAnnoyed_RecoverFromBump
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = global
						state = AngryChase_Global
						params = [{name = retry_on_miss ref = retry_on_miss}
							{name = retry_on_miss val = false}
							{name = retry_on_hit ref = retry_on_hit}
							{name = retry_on_hit val = false}]
					}]
			}
			{
				events = [exit_behavior]
				responses = [{replacement = cleanup
						state = bv_runscript
						params = [{name = script_name val = AngryChaseExit}]
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_RecoverFromBump
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect_knockdown
						state = DetectEnemyKnockdown
					}]
			}
			{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_AngryChase_Approach
					}]
			}
			{
				events = [Enemy_Knocked_Down]
				responses = [{replacement = this
						state = Bv_AngryChase_RecoverFromBumpToPostAttackAnim
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_RecoverFromBumpToPostAttackAnim
		transitions = [{conditions = [{name = agent_isreacting
						result = false
					}]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackSuccessAnim
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_Approach
		transitions = [{events = [enter_behavior]
				responses = [{replacement = approach
						state = AngryChase_Approach
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
				events = [path_blocked
					Give_Up_Chase]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackFailAnim
					}]
			}
			{
				events = [Enemy_Knocked_Down]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackSuccessAnim
					}]
			}
			{
				events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_AngryChase_FinishKnockdown
					}]
			}
			{
				conditions = [{name = agent_hasclearaim}]
				responses = [{replacement = this
						state = Bv_AngryChase_Attack
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = vo_breath
						state = StopBreathLoop
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_Attack
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = AngryChase_Attack
					}]
			}
			{
				events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_AngryChase_FinishKnockdown
					}]
			}
			{
				events = [Lunge_Missed
					Punch_Missed]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackFailAnim
					}]
			}
			{
				events = [Attack_Success]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackSuccessAnim
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_AttackSuccessAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = AngryChase_AttackSuccessAnim
					}]
			}
			{
				events = [Retry_Attack]
				responses = [{replacement = this
						state = Bv_AngryChase_Approach
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_FinishKnockdown
		transitions = [{events = [Ragdoll_Knockdown_Done]
				responses = [{replacement = this
						state = Bv_AngryChase_AttackFailAnim
					}]
			}]
	}
	registerstate {
		name = Bv_AngryChase_AttackFailAnim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = AngryChase_AttackFailAnim
					}]
			}
			{
				events = [Retry_Attack]
				responses = [{replacement = this
						state = Bv_AngryChase_Approach
					}]
			}]
	}
endscript

script AngryAnnoyed_Global 
	onexitrun \{AngryAnnoyed_Global_Exit}
	obj_suspendenable \{on = 0}
endscript

script AngryAnnoyed_Global_Exit 
	obj_suspendenable \{on = 1}
endscript

script AngryChase_Global 
	begin
	interact_getinteractstate
	if (<interact_state> = invalid)
		break
	endif
	wait 1 gameframe
	repeat
	Interest_GetEnemy
	if NOT gotparam enemy
		scriptassert 'Bv_AngryChase behavior called without setting an enemy interest.'
	endif
	change NumAngryChaseBehaviorPeds = ($NumAngryChaseBehaviorPeds + 1)
	agent_setinterest {interest_type_id = target
		object_id = <enemy>
		acquire_vis_loc = false}
	agent_setinterest {interest_type_id = location
		object_id = <enemy>
		acquire_vis_loc = false}
	GetCOIMPriority
	settags coim_priority = <coimpriority>
	SetCOIMPriority priority = $coim_priority_permanent
	settags retry_on_miss = <retry_on_miss>
	settags retry_on_hit = <retry_on_hit>
	obj_suspendenable on = 0
	eventcache_add event_id = force_calm_down
	locator_settraveler traveler = terrain_ped_urgent
	navcollision_enablecollideresidents off
	Navigation_DisableAvoidance
	ai_giveorder {replacement = dist_give_up
		name = Bv_GenEvents_Distance
		params = {distance = $PedAngryChaseTooFarDist
			greater_than = angry_chase_done
			less_than = Null_Event
			interest_type_id = location}}
	ai_giveorder replacement = state name = Bv_AngryChase_RecoverFromBump
	wait 2.0 seconds
	playvoiceoverbyevent event_id = GetAngry finished_event_id = Angry_Vo_Finished
endscript

script AngryChaseExit 
	navcollision_enablecollideresidents \{on}
	Navigation_EnableAvoidance
	if getsingletag \{pushed_angry_reaction_state}
		if (<pushed_angry_reaction_state> = true)
			agent_popreactionstate
			settags \{pushed_angry_reaction_state = false}
		endif
	endif
	locator_settraveler \{traveler = terrain_ped_trivial}
	getsingletag \{coim_priority}
	SetCOIMPriority priority = <coim_priority>
	obj_suspendenable \{on = 1}
	change NumAngryChaseBehaviorPeds = ($NumAngryChaseBehaviorPeds - 1)
	if ($NumAngryChaseBehaviorPeds = 0)
		goal_viewport_kill \{goal_string = 'AngryChase'}
	endif
endscript

script AngryChase_Approach 
	push_reaction_state = true
	if getsingletag pushed_angry_reaction_state
		if (<pushed_angry_reaction_state> = true)
			<push_reaction_state> = false
		endif
	endif
	if (<push_reaction_state> = true)
		agent_pushreactionstate state = angry
		settags pushed_angry_reaction_state = true
	endif
	ai_giveorder replacement = reload name = Bv_EnableItemControlReload
	ai_giveorder replacement = lookat name = Bv_LookAt_Enemy
	looking_at_enemy = true
	ai_giveorder {replacement = move
		name = Bv_MoveToWithOffset_Loop
		params = {movement_desc = $Skate_Combat_Melee_MovementDesc
			offset_movement_desc = $Skate_Combat_Melee_MovementDesc
			interest_type_id = enemy
			relative_offset_type = movement
			relative_offset = (0.0, 0.0, 0.0)
			finished_event_id = MoveTo_Finished
			intercept = true
			max_intercept_lead = 10.0
			lead_dist_ratio = 0.8
			closest_lead_pos = 1.1}}
	ai_giveorder replacement = equip name = EquipVelocitySpecificWeapon
	getstarttime
	AIInfo_GetAngryChaseCloseTimeout
	AIInfo_GetAngryChaseFarTimeout
	angry_chase_close_timeout = (<angry_chase_close_timeout> * 1000)
	angry_chase_far_timeout = (<angry_chase_far_timeout> * 1000)
	<should_give_up> = false
	begin
	obj_getid
	Interest_GetEnemy
	if NOT gotparam enemy
		soft_assert "enemy interest not found in script AngryChase_Approach"
		wait 0.5 seconds
		continue
	endif
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
	getelapsedtime starttime = <starttime>
	navigation_getpathdistance
	if (<path_distance> > $PedAngryChaseTooFarPathDist)
		ai_giveorder {replacement = move name = Bv_StopInstant}
		<should_give_up> = true
	endif
	wait 0.2 seconds
	if (<dist_atob> < $PedAngryChaseCloseDist)
		if (<elapsedtime> > <angry_chase_close_timeout>)
			<should_give_up> = true
		endif
	else
		if (<elapsedtime> > <angry_chase_far_timeout>)
			<should_give_up> = true
		endif
	endif
	if (<should_give_up> = true)
		eventcache_add event_id = Give_Up_Chase
		break
	endif
	repeat
endscript

script EquipVelocitySpecificWeapon 
	inventory_selectiteminslot item_slot_id = fist
	inventory_equipiteminstant equip_slot_id = left_hand
	fist_equipped = true
	settags fist_equipped = true
	begin
	obj_getvelocity
	normalizevector <vel>
	if (<fist_equipped> = true)
		if (<length> > 4.0)
			inventory_unequipactiveiteminstant
			inventory_selectiteminslot item_slot_id = charge
			inventory_equipiteminstant equip_slot_id = left_hand
			<fist_equipped> = false
			settags fist_equipped = false
		endif
	else
		if (<length> < 4.0)
			inventory_unequipactiveiteminstant
			inventory_selectiteminslot item_slot_id = fist
			inventory_equipiteminstant equip_slot_id = left_hand
			<fist_equipped> = true
			settags fist_equipped = true
		endif
	endif
	wait 0.1 seconds
	repeat
endscript

script AngryChase_Attack 
	ai_giveorder replacement = aim name = Bv_AimAt_Target
	getsingletag fist_equipped
	if (<fist_equipped> = true)
		ai_giveorder {replacement = move
			name = Bv_MoveTo_Loop_Enemy
			params = {movement_desc = $Skate_Combat_Melee_MovementDesc}}
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
			Interest_GetEnemy
			if ObjectIsPlayer <enemy>
				if CanSkaterInterruptPedTackle
					<enemy> :obj_getvelocity
					normalizevector <vel>
					bump_vel = (<norm> * 10.0)
					eventcache_add event_id = bumped event_data = {bumpvelocity = <bump_vel> override_reaction_state = true}
					wait 1 gameframe
					eventcache_add event_id = force_calm_down
					<Attack_Success> = false
				else
					KnockDownEnemy impact_type = lunge
					<Attack_Success> = true
				endif
			else
				KnockDownEnemy impact_type = lunge
				<Attack_Success> = true
			endif
		endif
		case shot_success
		ai_giveorder replacement = aim name = null
		KnockDownEnemy impact_type = punch
		<Attack_Success> = true
		case Lunge_Anim_Finished
		if (<Attack_Success> = true)
			eventcache_add event_id = Attack_Success
		else
			eventcache_add event_id = Lunge_Missed
		endif
		case MeleeAttack_Finished
		if (<Attack_Success> = true)
			eventcache_add event_id = Attack_Success
		else
			eventcache_add event_id = Punch_Missed
		endif
		case Disable_Lunge_Knockdown
		<lunge_knockdown_enabled> = false
		case Start_Get_Up_Spin
		Interest_SetLocation location = skater
		ai_giveorder replacement = aim name = Bv_LookAt_Location
		ai_giveorder replacement = lunge name = null
		ai_giveorder replacement = spin name = bv_setmovedesc params = {movement_desc = {shuffle = false} , movement_desc_stage = action}
	endswitch
	repeat
endscript

script AngryChase_AttackSuccessAnim 
	getsingletag \{retry_on_hit}
	if (<retry_on_hit> = true)
		finished_event_id = Retry_Attack
	else
		finished_event_id = angry_chase_done
	endif
	Attack_PerformAttackSuccessAnim finished_event_id = <finished_event_id>
endscript

script Attack_PerformAttackSuccessAnim 
	ai_giveorder replacement = lookat name = Bv_LookAt_Enemy
	<counter> = 0
	<wait_timer> = 1
	<attack_success_counts> = Random (@ 3 @ 4 @ 5 )
	begin
	if (<counter> < 2)
		Interest_GetEnemy
		obj_getid
		if NOT gotparam enemy
			<dist_atob> = 10.0
		else
			getdistance objecta = <enemy> objectb = <objid>
		endif
		if (<dist_atob> < 7.0)
			ai_giveorder replacement = vo name = playvoiceoverbyevent params = {event_id = ShakesFist}
			if (<counter> = 0)
				agent_playcustomanim {anim = Attack_FirstSuccess motion_extract = true blend_period = 0.6 pause_movement = false play_mode = once
					finished_event_id = local_ev_anim_finished interrupt_event_id = local_ev_anim_finished}
			else
				agent_playcustomanim {anim = Attack_Success motion_extract = true blend_period = 0.6 pause_movement = false play_mode = once
					finished_event_id = local_ev_anim_finished interrupt_event_id = local_ev_anim_finished}
			endif
			blockuntilevent type = local_ev_anim_finished
			counter = (<counter> + 1)
			wait <wait_timer> seconds
			<wait_timer> = (<wait_timer> + 1)
		else
			wait Random (@ 0.5 @ 1.0 )seconds
			break
		endif
	else
		break
	endif
	repeat
	eventcache_add event_id = <finished_event_id>
endscript

script AngryChase_AttackFailAnim 
	getsingletag \{retry_on_miss}
	if (<retry_on_miss> = true)
		finished_event_id = Retry_Attack
	else
		finished_event_id = angry_chase_done
	endif
	ai_giveorder \{replacement = lookat
		name = Bv_LookAt_Location}
	ai_giveorder {replacement = anim
		name = Bv_PlayAnimSet
		params = {anim_stage = custom
			anim_set_id = Human_Angry
			blend_in_dur = 0.2
			blend_out_dur = 0.2
			sync_start_time = false
			finished_event_id = <finished_event_id>}}
endscript

script CreateChaseViewport 
	if gman_hasactivegoals
		return
	endif
	goal_viewport_kill goal_string = 'AngryChase'
	obj_getid
	goal_viewport_create {
		goal_string = 'AngryChase'
		controlscript = ChaseViewportCam
		vport_pos = (516.0, 70.0)
		vport_scale = (0.3 * (16.0, 9.0))
		viewport_style = viewport_element
		near_clip = 0.1
		far_clip = 75.0
		fov = 72
		skater_visible = 1
		tags = {chase_obj_id = <objid> fall_cam = <fall_cam>}
		appearance_priority = 2
	}
endscript

script ChaseViewportCam 
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
		time = 3.0
		motion = ease_in
	}
	goal_viewport_parent :domorph alpha = 1 time = 0.6
	wait 3.0 seconds
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
	<chase_obj_id> :blockuntilevent anytypes = [Attack_Success path_blocked Give_Up_Chase cam_event_angry_attack shot_success MeleeAttack_Finished]
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
			time = 0.5
		}
		ccam_waitmorph
		wait 1.5 seconds
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.7, 1.134594, -0.150738)
			quat = (0.52241, 0.48684004, -0.513358)
			lookat = <chase_obj_id>
			lookatbone = bone_head
			fov = 55.0
			time = 1.2
		}
		ccam_waitmorph
		wait 3.0 seconds
		default
		ccam_domorph {
			lockto = <chase_obj_id>
			locktobone = control_root
			pos = (1.7, 1.134594, -0.150738)
			quat = (0.52241, 0.48684004, -0.513358)
			lookat = <chase_obj_id>
			lookatbone = bone_head
			lookatpos = (0.0, 0.0, 0.0)
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
			time = 2.0
		}
		ccam_waitmorph
	endswitch
	goal_viewport_parent :domorph alpha = 0 time = 0.5
endscript

script KnockDownEnemy 
	if NOT gotparam enemy
		Interest_GetEnemy
	endif
	if ObjectIsPlayer <enemy>
		Navigation_GetBodyAlignment
		switch <impact_type>
			case punch
			impact_impulse = (150 * <body_alignment>)
			impact_bone = bone_head
			case lunge
			impact_impulse = (-400 * <body_alignment>)
			impact_bone = bone_pelvis
		endswitch
		try_to_knock_down_skater impact_impulse = <impact_impulse> impact_bone = <impact_bone>
	else
		if <enemy> :agent_comparereactionstate state = transition
			return false
		endif
		obj_getid
		<enemy> :eventcache_add {event_id = ragdoll_knockdown
			event_data = {attacker = <objid>
				damage = $body_check_ped_damage
				recdata = pi_default_rec
				angle_left = 0.0
				angle_up = 0.4
				impulse_strength_factor = 1.0
				impulse_bone = bone_neck
				max_vel_consideration = 13.0}}
	endif
	launchevent type = Knocked_Down_By_Attack target = <enemy> data = {attacker = <objid>}
endscript

script ShowLostStokens 
	GMan_GetStokens
	wait \{$KnockdownToStokenDisplayDelay
		seconds}
	panel_lost_stoken num_stokens = <stokens>
	soundevent \{event = Stoken_Lost_SFX}
endscript

script StartBreathLoop 
	if agent_isplayingvo
		blockuntilevent \{type = Angry_Vo_Finished}
	endif
	getsingletag \{voice_profile}
	if gotparam \{voice_profile}
		appendsuffixtochecksum base = <voice_profile> suffixstring = '_BreathLoop_Start'
		soundevent event = <appended_id>
	endif
endscript

script DuckDownBreathLoop 
	getsingletag \{voice_profile}
	if gotparam \{voice_profile}
		appendsuffixtochecksum base = <voice_profile> suffixstring = '_BreathLoop_DuckDown'
		soundevent event = <appended_id>
	endif
endscript

script DuckUpBreathLoop 
	getsingletag \{voice_profile}
	if gotparam \{voice_profile}
		appendsuffixtochecksum base = <voice_profile> suffixstring = '_BreathLoop_DuckUp'
		soundevent event = <appended_id>
	endif
endscript

script StopBreathLoop 
	getsingletag \{voice_profile}
	if gotparam \{voice_profile}
		appendsuffixtochecksum base = <voice_profile> suffixstring = '_BreathLoop_Stop'
		soundevent event = <appended_id>
	endif
endscript
