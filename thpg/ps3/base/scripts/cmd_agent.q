
script Agent_OldGiveOrder 
	if NOT gotparam name
		obj_getid
		softassert "ai_GiveOrder: name parameter not found for object: %o" o = <objid>
		return
	endif
	if scriptexists <name>
		behavior_clearhierarchy hierarchy = order
		behavior_clearhierarchy hierarchy = logic
		obj_switchscript <name> params = <params>
		printscriptinfo "possible deprecated command source"
		kill
	else
		obj_switchscript Agent_BlankForCoreSwitchSafety
		behavior_clearhierarchy hierarchy = logic
		behavior_replacehierarchy hierarchy = order state = <name> params = <params>
	endif
endscript

script Agent_GiveOrder replacement = giveorder_child
	obj_getid
	if isplayer
		softassert "ai_GiveOrder cannot be used on player"
		return
	endif
	if NOT gotparam name
		softassert "ai_GiveOrder: name parameter not found for object: %o" o = <objid>
		return
	endif
	if NOT gotparam dont_clear_switch_script
		obj_switchscript Agent_BlankForCoreSwitchSafety
	endif
	behavior_replacehierarchy {hierarchy = current
		replacement = <replacement>
		state = <name>
		params = <params>
	}
endscript

script Agent_ClearOrders 
	obj_switchscript \{Agent_BlankForCoreSwitchSafety}
	obj_getid
	behavior_clearhierarchy \{hierarchy = order}
	behavior_clearhierarchy \{hierarchy = logic}
	behavior_clearhierarchy \{hierarchy = life}
	behavior_replacehierarchy \{hierarchy = interact
		state = bv_blank}
endscript

script Agent_ClearBehaviorsOnBlockedPath 
	wait 1 frame
	obj_getid
	printf ">>> BLOCKED PATH: Clearing orders for agent [%a]" a = <objid>
	Agent_ClearOrders
	if agent_hasdriver
		agent_getdriver
		<objid> = <driver>
	else
		obj_getid
	endif
	if containscomponent name = pedlife
		<objid> :pedlife_gettype
		if gotparam ped_type
			if (<ped_type> = ped_life)
				printf ">>> BLOCKED PATH: Deleting agent [%a]" a = <objid>
				<objid> :obj_spawnscriptlater InstantDeathCleanup
			endif
		endif
	endif
endscript

script Agent_InstantDeath 
	wait \{1
		frame}
	Agent_ClearOrders
	obj_spawnscriptlater \{InstantDeathCleanup}
endscript

script InstantDeathCleanup 
	ped_fade_and_destroy
endscript

script Agent_BlankForCoreSwitchSafety 
endscript

script Agent_SetBehavior 
	if NOT gotparam \{name}
		obj_getid
		softassert "ai_SetBehavior: name parameter not found for object: %o" o = <objid>
	endif
	if scriptexists <name>
		<name> <params> hierarchy = logic
	else
		behavior_replacehierarchy hierarchy = logic state = <name> params = <params>
	endif
endscript

script Agent_SetLifeBehavior 
	cmd_legacy
	if NOT gotparam \{name}
		obj_getid
		softassert "ai_SetLifeBehavior: name parameter not found for object: %o" o = <objid>
	endif
	ai_giveorder name = <name> params = <params>
endscript

script Agent_DropItem 
	obj_getid
	if NOT iscreated <attacker>
		return
	endif
	if <attacker> :agent_isfriendlyto agent = <objid>
		return
	endif
	if ObjectIsPlayer <attacker>
		if agent_isfriendlyto agent = <attacker>
			return
		endif
	endif
	Agent_DropEquippedWeaponsAsCollectables hit_dir = <hit_dir>
	if gotparam weapon_dropped
		if ObjectIsPlayer <attacker>
			if NOT agent_isfriendlyto agent = hero
				hero :Hero_AwardDeadEyeTimeBonus type = weapon_shot_enemy
				Message_DidGood itemtext = "Weapon Shot"
				Random (
					@ Hero_PlayVoiceOverByEvent event_id = weaponshot
					@*10 playvoiceoverbyevent event_id = weaponshot
					)
				spawnscriptlater SFX_Weapon_Drop
				track_stat set = {enemy_weapon_shots = (tracked_stats.enemy_weapon_shots + 1)}
			endif
		endif
	endif
endscript

script Agent_Ragdoll \{angle_left = 0.0
		angle_up = 0.4
		impulse_strength_factor = 1.2
		impulse_bone = bone_stomach_lower
		max_vel_consideration = 4.0
		damage = 0.0}
	obj_getid
	eventcache_add event_id = ragdoll_knockdown event_data = {recdata = pi_default_rec
		angle_left = <angle_left>
		angle_up = <angle_up>
		impulse_strength_factor = <impulse_strength_factor>
		impulse_bone = <impulse_bone>
		max_vel_consideration = <max_vel_consideration>
		damage = <damage>
		attacker = <objid>
	}
endscript

script Teleport 
	obj_getid
	if obj_hascomponent \{navigation}
		navigation_stop
		Navigation_GetSteeringObjId
		if gotparam \{steering_obj_id}
			if NOT (<steering_obj_id> = <objid>)
				<steering_obj_id> :locator_teleport <...>
			endif
		endif
	endif
	if ObjectIsPlayer <objid>
		if scriptexists \{Ride_GetMountId}
			if gotparam \{MountId}
				<MountId> :locator_teleport <...>
			endif
		else
			if gotparam \{position}
				<pos> = <position>
			endif
			TeleportSkaterToNode <...>
		endif
	endif
	locator_teleport <...>
endscript

script Agent_Teleport 
	Teleport <...>
endscript

script Agent_BlockUntilVehicleTransitionIsSafe 
	begin
	if Agent_IsCalmAndNotReacting
		if NOT agent_isinvehicletransition
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script Agent_EquipSkateboardAndBlock 
	Agent_BlockUntilVehicleTransitionIsSafe
	if NOT agent_hasvehicleofspecies \{species = skateboard}
		ai_giveorder \{name = Bv_EquipSkateboard}
		blockuntilevent \{anytypes = [
				AcquireVehicle_Finished
				AcquireVehicle_Failed
			]}
	endif
endscript

script Agent_UnequipSkateboardAndBlock 
	Agent_BlockUntilVehicleTransitionIsSafe
	if agent_hasvehicleofspecies \{species = skateboard}
		ai_giveorder \{name = Bv_UnequipSkateboard}
		blockuntilevent \{anytypes = [
				ReleaseVehicle_Finished
				ReleaseVehicle_Failed
			]}
	endif
endscript
