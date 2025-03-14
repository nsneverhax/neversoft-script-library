
script cmd_legacy 
	printscriptinfo \{"_____________________COMMAND BEING DEPRECATED_____________________"}
endscript

script Disable_AI 
	cmd_legacy
	navigation_stop
	behavior_clearhierarchies
	behavior_enable \{off}
	navigation_enable \{off}
endscript

script Enable_AI 
	cmd_legacy
	BehaviorSystem_SetDefaultHierarchies
	behavior_enable \{on}
	navigation_enable \{on}
endscript

script Agent_RunLife 
	cmd_legacy
	ai_giveorder name = <state> params = <params>
endscript

script Agent_Stand \{hierarchy = logic}
	cmd_legacy
	agent_clearinterest \{interest_type_id = enemy}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = bv_stand}
endscript

script Agent_StandIdle \{hierarchy = logic}
	cmd_legacy
	agent_clearinterest \{interest_type_id = enemy}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_StandIdle}
endscript

script StandIdle_Anim \{hierarchy = logic}
	cmd_legacy
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = bv_stand}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_CustomAnimLoop
		params = <...>}
endscript

script CustomAnimLoop \{hierarchy = logic}
	cmd_legacy
	if behavior_isenabled
		behavior_replacehierarchy {hierarchy = <hierarchy>
			state = Bv_CustomAnimLoop
			params = <...>}
	else
		behavior_replacehierarchy {hierarchy = animation
			state = Bv_Anims_CustomLoop
			params = <...>}
	endif
endscript

script customanim \{hierarchy = logic}
	cmd_legacy
	if behavior_isenabled
		behavior_replacehierarchy {hierarchy = <hierarchy>
			state = Bv_CustomAnim
			params = <...>}
	else
		behavior_replacehierarchy {hierarchy = animation
			state = Bv_Anims_Custom
			params = <...>}
	endif
	if gotparam \{BlockUntilFinished}
		wait \{1
			frame}
		blockuntilevent \{type = CustomAnimation_Finished}
	endif
endscript

script Agent_Crouch \{hierarchy = logic}
	cmd_legacy
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_Crouch}
endscript

script Agent_Cower 
	cmd_legacy
	customanim \{anim = Ped_Male_Cower
		cycle}
endscript

script Incapacitate 
	cmd_legacy
	AIInfo_SetHealth 1
	<bone> = bone_chest
	hero :obj_getboneposition {bone = <bone>}
	<bone_pos> = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	obj_getboneposition {bone = <bone>}
	<source_pos> = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	hit_dir = (<bone_pos> - <source_pos>)
	normalizevector <hit_dir>
	hit_dir = <norm>
	eventcache_add {event_id = shot
		event_data = {weapon_damage = 100
			hit_bone = <bone>
			hit_pos = <bone_pos>
			source_pos = <source_pos>
			hit_dir = <hit_dir>
			weapon = PISTOL_01
			weapon_type = pistol
			attacker = hero
		}
	}
endscript

script KillMe 
	cmd_legacy
	ai_printf \{"kill me"}
	eventcache_add \{event_id = custom_death
		event_data = {
			attacker = hero
			anim = [
				Ped_Enemy_Dead_BallzakShot
				Ped_Enemy_Dead_Left
				Ped_Enemy_Dead_KneeCap
				Ped_Enemy_Dead_L_Leg
				Ped_Enemy_Dead_Right
				Ped_Enemy_Dead_R_Leg
			]
			orient_type = move
		}}
endscript

script InstantDeath 
	cmd_legacy
	if getsingletag spawn_node_name
		getnode <spawn_node_name>
		behavior_life_params = (<node>.behavior_life_params)
		if gotparam behavior_life_params
			getrandomarrayelement (<behavior_life_params>.anim)
			anim = <element>
		endif
	endif
	agent_getspecies
	if (<species> = human)
		if NOT gotparam anim
			anim = Random (@ dead1
				@ dead2
				@ dead3
				@ dead4
				@ dead5
				@ dead6
				@ dead7
				@ dead8 )
		endif
	else
		if (<species> = horse)
			anim = Horse_Death_Headshot_L
		endif
	endif
	settags dont_change_priority = 1
	CustomDeath anim = <anim>
	obj_forceupdate
endscript

script CustomDeath 
	cmd_legacy
	eventcache_add {event_id = custom_death
		event_data = {attacker = hero
			anim = <anim>
			orient_type = move
		}
	}
endscript

script Agent_Roam hierarchy = logic
	cmd_legacy
	<interest_type_id> = center
	if gotparam object
		if NOT gotparam movement_desc
			GetMovementArchetype type = ObjectArrival
		endif
		agent_setinterest {interest_type_id = <interest_type_id> , object_id = <object> , acquire_vis_loc = true}
	else
		if NOT gotparam movement_desc
			GetMovementArchetype type = PointArrival
		endif
		if gotparam waypoint
			agent_setinterest {interest_type_id = <interest_type_id> , waypoint = <waypoint> , acquire_vis_loc = true}
		else
			agent_setinterest {interest_type_id = <interest_type_id> , cell = <cell> , pos = <pos> , acquire_vis_loc = true}
		endif
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_Equipped_MoveTo_Loop
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent anytypes = [MoveTo_Finished path_blocked]
	endif
endscript

script Agent_FollowPath hierarchy = logic
	cmd_legacy
	if NOT gotparam movement_desc
		<movement_desc> = default_follow_path
	endif
	if NOT gotparam waypoint
		Navigation_GetSteeringObjId
		<waypoint> = <steering_obj_id>
	endif
	<finished_event_id> = FollowPath_Finished
	printf "_______followpath"
	printstruct <...>
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_FollowPath
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = FollowPath_Finished
	endif
endscript

script Agent_AvoidOnPath hierarchy = logic
	cmd_legacy
	if NOT gotparam movement_desc
		<movement_desc> = default_avoid_on_path
	endif
	if gotparam max_speed
		<speed> = max_speed
	endif
	if NOT gotparam waypoint
		Navigation_GetSteeringObjId
		<waypoint> = <steering_obj_id>
	endif
	<finished_event_id> = FollowPath_Finished
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_FollowPath
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = FollowPath_Finished
		sg_printf "!!!!!!!!!!!!!!!!!!!!! UNBLOCK AVOID ON PATH !!!!!!!!!!!!!!!!!!!!"
	endif
endscript

script Agent_Follow object = hero hierarchy = logic
	cmd_legacy
	if NOT <object> :obj_hascomponent agent
		Navigation_Move object = <object>
		if gotparam local_offset
			printf "warning: local offsets dont work with level objects"
		endif
		return
	endif
	if NOT gotparam movement_desc
		GetMovementArchetype type = ObjectArrival
	endif
	if NOT gotparam interest_type_id
		<interest_type_id> = enemy
	endif
	if gotparam world_offset
		<relative_offset_type> = world
		<relative_offset> = <world_offset>
	else
		if gotparam local_offset
			<relative_offset_type> = alignment
			<relative_offset> = <local_offset>
		else
			<relative_offset_type> = movement
			<relative_offset> = <movement_offset>
		endif
	endif
	agent_setinterest {interest_type_id = <interest_type_id> , object_id = <object> , acquire_vis_loc = true}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_MoveTo_Loop
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent anytypes = [MoveTo_Finished path_blocked]
	endif
endscript

script Agent_Flee object = hero max_dist = 25 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_center>}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_MoveAway_Loop_Enemy
		params = {interest_type_id = enemy
			finished_event_id = MoveAway_Finished}}
	if gotparam BlockUntilFinished
		blockuntilevent anytypes = [MoveAway_Finished path_blocked]
	endif
endscript

script Agent_MountHorse hierarchy = logic
	cmd_legacy
	if gotparam horse_name
		cmd_legacy id = mounthorse
		<object> = <horse_name>
	endif
	agent_setinterest {interest_type_id = vehicle , object_id = <object> , acquire_vis_loc = true}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_AcquireVehicle
		params = <...>}
	if gotparam BlockUntilFinished
		printf "()()()() blocking for mount finished"
		blockuntilevent type = AcquireVehicle_Finished debug_donotskipblock = 1
	endif
endscript

script Agent_DismountHorse \{hierarchy = logic}
	cmd_legacy
	if gotparam \{horse_name}
		cmd_legacy \{id = DisountHorse}
		<object> = <horse_name>
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_ReleaseVehicle
		params = <...>}
	if gotparam \{BlockUntilFinished}
		blockuntilevent \{type = ReleaseVehicle_Finished}
	endif
endscript

script Agent_AcquireVehicle \{hierarchy = logic}
	cmd_legacy
	agent_setinterest {interest_type_id = vehicle , object_id = <object> , acquire_vis_loc = true}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_AcquireVehicle
		params = <...>}
	if gotparam \{BlockUntilFinished}
		blockuntilevent \{type = AcquireVehicle_Finished}
	endif
endscript

script Agent_TorsoIdle \{hierarchy = logic}
	cmd_legacy
	inventory_unequipitem
	agent_clearinterest \{interest_type_id = enemy}
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = secondary
		state = bv_blank}
endscript

script Agent_AutoFire \{object = hero
		hierarchy = logic}
	cmd_legacy
	if gotparam \{enemy}
		<object> = <enemy>
	endif
	if gotparam \{object}
		agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = secondary
		state = Bv_SimpleAimCombat_AllItems}
endscript

script Agent_Shoot enemy = hero hierarchy = logic
	cmd_legacy
	if gotparam enemy_node
		agent_setinterest {interest_type_id = enemy , waypoint_id = <enemy_node> , acquire_vis_loc = true}
	else
		if gotparam enemy
			if NOT iscreated <enemy>
				return
			endif
			<object> = <enemy>
			agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
		endif
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = secondary
		state = Bv_SimpleAimCombat_AllItems}
endscript

script Agent_Aim hierarchy = logic
	cmd_legacy
	if NOT inventory_hasselecteditem
		if NOT inventory_hasiteminslot {item_type_id = primaryweapon item_slot_id = pistol}
			return
		else
			inventory_selectiteminslot {item_type_id = primaryweapon item_slot_id = pistol}
		endif
	endif
	inventory_equipitem {equip_slot_id = right_hand}
	if gotparam enemy
		<object> = <enemy>
	endif
	if gotparam object
		agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = secondary
		state = Bv_AimAt_Target}
endscript

script ReloadAmmo \{hierarchy = logic}
	cmd_legacy
	behavior_replacehierarchy {hierarchy = <hierarchy>
		replacement = secondary
		state = Bv_ReloadItem_Once}
endscript

script Agent_Combat enemy = hero max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	if NOT gotparam movement_desc
		GetMovementArchetype type = combat
		Navigation_SetMoveDescription <movement_desc>
	endif
	if gotparam enemy_node
		agent_setinterest {interest_type_id = enemy , waypoint_id = <enemy_node> , acquire_vis_loc = true}
	else
		if gotparam enemy
			if NOT iscreated <enemy>
				return
			endif
			<object> = <enemy>
			agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
		endif
	endif
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	if gotparam coverpoint
		<waypoint> = <coverpoint>
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	if gotparam waypoint
		agent_setinterest {interest_type_id = location , waypoint_id = <waypoint> , acquire_vis_loc = true}
		behavior_replacehierarchy {hierarchy = <hierarchy>
			state = Bv_MoveToLocationCombat
			params = <...>}
	else
		sg_printf "1___here"
		<interest_type_id> = enemy
		behavior_replacehierarchy {hierarchy = <hierarchy>
			state = bv_balancedcombat_prefer
			params = <...>}
	endif
	if gotparam BlockUntilFinished
		<object> :blockuntilevent type = dead_on_ground
	endif
endscript

script Agent_CoverToMeleeCombat enemy = hero max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	if NOT gotparam movement_desc
		GetMovementArchetype type = combat
		Navigation_SetMoveDescription <movement_desc>
	endif
	if gotparam enemy_node
		agent_setinterest {interest_type_id = enemy , waypoint_id = <enemy_node> , acquire_vis_loc = true}
	else
		if gotparam enemy
			if NOT iscreated <enemy>
				return
			endif
			<object> = <enemy>
			agent_setinterest {interest_type_id = enemy , object_id = <object> , acquire_vis_loc = true}
		endif
	endif
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	if gotparam coverpoint
		<waypoint> = <coverpoint>
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	if gotparam waypoint
		agent_setinterest {interest_type_id = location , waypoint_id = <waypoint> , acquire_vis_loc = true}
		behavior_replacehierarchy {hierarchy = <hierarchy>
			state = Bv_CoverToMeleeCombat
			params = <...>}
	else
		combat <...>
	endif
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_DetectCombat max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_DetectCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_PatrolDetectCombat max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	Navigation_SetMoveDescription {strafe = false
		outside_boundary = arrive
		movement = walk_slow
		stop_distance = 0.5
		arrival_distance = 1.25
		departure_distance = 1
		point_arrival_distance = 0.75
		stopping_distance = 2.5
		starting_distance = 2.5
	}
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_PatrolDetectCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_PatrolDistDetectCombat max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	Navigation_SetMoveDescription {strafe = false
		outside_boundary = arrive
		movement = run_fast
		stop_distance = 0.5
		arrival_distance = 1.25
		departure_distance = 1
		point_arrival_distance = 0.75
		stopping_distance = 2.5
		starting_distance = 2.5
	}
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	Vision_SetShape shape = sphere
	Vision_DisableLOS
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_PatrolDetectCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_FollowDetectCombat object = hero max_dist_object = 900 max_dist_enemy = 100000 hierarchy = logic
	cmd_legacy
	if gotparam world_offset
		<relative_offset_type> = world
		<relative_offset> = <world_offset>
	else
		if gotparam local_offset
			<relative_offset_type> = alignment
			<relative_offset> = <local_offset>
		else
			<relative_offset_type> = movement
			<relative_offset> = <movement_offset>
		endif
	endif
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	agent_setinterest {interest_type_id = center , object_id = <object> , acquire_vis_loc = true}
	agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_object>}
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_FollowDetectCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_FollowDistDetectCombat object = hero max_dist_object = 900 max_dist_enemy = 100000 hierarchy = logic
	cmd_legacy
	if gotparam world_offset
		<relative_offset_type> = world
		<relative_offset> = <world_offset>
	else
		if gotparam local_offset
			<relative_offset_type> = alignment
			<relative_offset> = <local_offset>
		else
			<relative_offset_type> = movement
			<relative_offset> = <movement_offset>
		endif
	endif
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	agent_setinterest {interest_type_id = center , object_id = <object> , acquire_vis_loc = true}
	agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_object>}
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	Vision_SetShape shape = sphere
	Vision_DisableLOS
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_FollowDetectCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_DetectMountCombat max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	agent_setinterest {interest_type_id = vehicle , object_id = <horse_name> , acquire_vis_loc = true}
	if NOT iscreated <horse_name>
		scriptassert "horse horse to mount not created yet"
	endif
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	<object> = <horse_name>
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_DetectAcquireVehicleCombat
		params = <...>}
	if gotparam BlockUntilFinished
		blockuntilevent type = dead_on_ground details = {subject = <object>}
		printf "____ unblocked squad combat"
	endif
endscript

script Agent_DistDetectAutofire \{hierarchy = logic}
	cmd_legacy
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription \{mode = stand}
	endif
	Vision_SetShape \{shape = sphere}
	Vision_DisableLOS
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_DetectSimpleAimCombat_AllItems
		params = <...>}
endscript

script Agent_DistDetectCombat max_dist_enemy = 15 max_dist_center = 15 hierarchy = logic
	cmd_legacy
	agent_setinterestmaxdesireddist {interest_type_id = enemy , max_dist = <max_dist_enemy>}
	if gotparam center_node
		agent_setinterest {interest_type_id = center , waypoint_id = <center_node> , acquire_vis_loc = true}
		agent_setinterestmaxdesireddist {interest_type_id = center , max_dist = <max_dist_center>}
	else
		agent_clearinterest {interest_type_id = center}
	endif
	Navigation_GetSteeringObjId
	obj_getid
	if (<steering_obj_id> = <objid>)
		Navigation_SetMoveDescription {mode = stand}
	endif
	if gotparam min_view_dist
		Vision_SetGainVisionDist {distance = <min_view_dist>}
	endif
	if gotparam max_view_dist
		Vision_SetLoseVisionDist {distance = <max_view_dist>}
	endif
	Vision_SetShape shape = sphere
	Vision_DisableLOS
	behavior_replacehierarchy {hierarchy = <hierarchy>
		state = Bv_DetectCombat
		params = <...>}
endscript

script guncombat 
	cmd_legacy
	sg_printf \{"_______________ guncombat"}
	combat <...>
endscript

script horsevhorseguncombat 
	cmd_legacy
	sg_printf \{"_______________ horsevhorseguncombat"}
	combat <...>
endscript

script horsevpedguncombat 
	cmd_legacy
	sg_printf \{"_______________ horsevpedguncombat"}
	combat <...>
endscript

script Squad_Combat \{enemy = hero
		max_dist_enemy = 15
		max_dist_center = 15}
	cmd_legacy
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :combat <...>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Squad_Stand 
	cmd_legacy
	squad_getmembers
	behavior_replacehierarchy {hierarchy = logic ,
		state = Bv_SquadStand
		params = {members = <members>}}
endscript

script Squad_StandIdle 
	cmd_legacy
	squad_getmembers
	behavior_replacehierarchy {hierarchy = logic ,
		state = Bv_SquadStandIdle
		params = {members = <members>}}
endscript

script Squad_Roam 
	cmd_legacy
	squad_getmembers
	squad_setinterest interest_type_id = center object_id = <object> waypoint = <waypoint> cell = <cell> pos = <pos>
	behavior_replacehierarchy {hierarchy = logic ,
		state = Bv_SquadMoveTo
		params = <...>}
	if gotparam \{BlockUntilFinished}
		blockuntilevent allobjects = <members> anytypes = [MoveTo_Finished path_blocked]
	endif
endscript

script Squad_Follow 
	cmd_legacy
	squad_getmembers
	squad_setinterest interest_type_id = center object_id = <object> waypoint = <waypoint>
	behavior_replacehierarchy {hierarchy = logic ,
		state = Bv_SquadFollow
		params = <...>}
	if gotparam \{BlockUntilFinished}
		blockuntilevent allobjects = <members> anytypes = [MoveTo_Finished path_blocked]
	endif
endscript

script RunLife 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_RunLife <...>
	else
		Agent_RunLife <...>
	endif
endscript

script GetSquadMembers 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		squad_getmembers
	else
		agent_getsquad
		<squad> :squad_getmembers
	endif
	return {members = <members>}
endscript

script GetNumSquadMembers 
	cmd_legacy
	GetSquadMembers
	getarraysize \{members}
	return {squad_size = <array_size>}
endscript

script stand 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_Stand
	else
		Agent_Stand
	endif
endscript

script standidle 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_StandIdle
	else
		Agent_StandIdle
	endif
endscript

script crouch 
	cmd_legacy
	Agent_Crouch
endscript

script Cower 
	cmd_legacy
	Agent_Cower
endscript

script Squad_RunLife 
	cmd_legacy
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :Agent_RunLife state = <name> params = <params>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Squad_SpawnScript 
	cmd_legacy
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :obj_spawnscriptlater <name> params = <params>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script roam 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_Roam <...>
	else
		Agent_Roam <...>
	endif
endscript

script followpath 
	cmd_legacy
	Agent_FollowPath <...>
endscript

script AvoidOnPath 
	cmd_legacy
	Agent_AvoidOnPath <...>
endscript

script follow 
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_Follow <...>
	else
		Agent_Follow <...>
	endif
endscript

script flee 
	cmd_legacy
	Agent_Flee <...>
endscript

script mounthorse 
	cmd_legacy
	Agent_MountHorse <...>
endscript

script DismountHorse 
	cmd_legacy
	Agent_DismountHorse <...>
endscript

script AcquireVehicle 
	cmd_legacy
	Agent_AcquireVehicle <...>
endscript

script TorsoIdle 
	cmd_legacy
	Agent_TorsoIdle
endscript

script AutoFire 
	cmd_legacy
	Agent_AutoFire <...>
endscript

script shoot 
	cmd_legacy
	Agent_Shoot <...>
endscript

script aim 
	cmd_legacy
	Agent_Aim <...>
endscript

script combat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	if containscomponent \{name = squadcommand}
		Squad_Combat <...>
	else
		Agent_Combat <...>
	endif
endscript

script CoverToMeleeCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_CoverToMeleeCombat <...>
endscript

script DetectCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_DetectCombat <...>
endscript

script PatrolDetectCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_PatrolDetectCombat <...>
endscript

script PatrolDistDetectCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_PatrolDistDetectCombat <...>
endscript

script FollowDetectCombat 
	cmd_legacy
	Agent_FollowDetectCombat <...>
endscript

script FollowDistDetectCombat 
	cmd_legacy
	Agent_FollowDistDetectCombat <...>
endscript

script DetectMountCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_DetectMountCombat <...>
endscript

script DistDetectAutofire \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_DistDetectAutofire <...>
endscript

script DistDetectCombat \{max_dist_enemy = 100000
		max_dist_center = 1500}
	cmd_legacy
	Agent_DistDetectCombat <...>
endscript

script Cheat_ShootAndDamage enemy = hero bone = bone_chest damage = 50
	cmd_legacy
	if NOT inventory_getactiveitemid
		return
	endif
	<weapon> = <item_id>
	if NOT inventory_getselecteditemslotid
		return
	endif
	<weapon_type> = <item_slot_id>
	<enemy> :obj_getboneposition {bone = <bone>}
	<bone_pos> = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	CreatePedGunshotEffects {hit_pos = <bone_pos>}
	obj_getboneposition {bone = bone_palm_r}
	<source_pos> = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0))
	obj_getid
	hit_dir = (<bone_pos> - <source_pos>)
	normalizevector <hit_dir>
	hit_dir = <norm>
	launchevent {target = <enemy>
		source = <objid>
		type = shot
		data = {weapon_damage = <damage>
			hit_bone = <bone>
			hit_pos = <bone_pos>
			source_pos = <source_pos>
			hit_dir = <hit_dir>
			weapon = <weapon>
			weapon_type = <weapon_type>
			attacker = <objid>}}
endscript

script crouchonvehicle 
	cmd_legacy
	CustomAnimLoop \{anims = [
			Gun_CrouchIdle
		]}
endscript

script no_shortcut 
	ai_printf \{"___________________________________"}
	ai_printf \{" "}
	ai_printf "  %s not implemented" s = <id>
	ai_printf \{"___________________________________"}
	block
endscript

script intercept 
	no_shortcur \{id = intercept}
endscript

script agentwait 
	no_shortcut \{id = agentwait}
endscript

script agentblock 
	no_shortcut \{id = agentblock}
endscript

script standidle_unarmed_bystander 
	no_shortcut \{id = unarmed_bystander}
endscript

script waitstate 
	no_shortcut \{id = waitstate}
endscript

script waitstatefinished 
	no_shortcut \{id = waitstatefinished}
endscript

script roamtocover 
	no_shortcut \{id = roamtocover}
endscript

script roamcoverexit 
	no_shortcut \{id = roamcoverexit}
endscript

script roamcoverseek 
	no_shortcut \{id = roamcoverseek}
endscript

script leancoverexit 
	no_shortcut \{id = leancoverexit}
endscript

script leancoverseek 
	no_shortcut \{id = leancoverseek}
endscript

script crouchcoverseek 
	no_shortcut \{id = crouchcoverseek}
endscript

script crouchcoverexit 
	no_shortcut \{id = crouchcoverexit}
endscript

script coverseek 
	no_shortcut \{id = coverseek}
endscript

script coverexit 
	no_shortcut \{id = coverexit}
endscript

script leanleft 
	no_shortcut \{id = leanleft}
endscript

script leanright 
	no_shortcut \{id = leanright}
endscript

script dodge 
	no_shortcut \{id = dodge}
endscript

script FollowMobileBSpline 
	no_shortcut \{id = FollowMobileBSpline}
endscript

script FollowStaticBSpline 
	no_shortcut \{id = FollowStaticBSpline}
endscript

script DodgeObject 
	no_shortcut \{id = DodgeObject}
endscript

script MobileDodge 
	no_shortcut \{id = MobileDodge}
endscript

script backoff 
	no_shortcut
endscript

script orbit 
	no_shortcut
endscript

script maintainenemylos 
	no_shortcut
endscript

script getbehind 
	no_shortcut
endscript

script lead 
	no_shortcut
endscript
