
script ai_giveorder 
	if containscomponent \{name = squadcommand}
		Squad_GiveOrder <...>
	else
		Agent_GiveOrder <...>
	endif
endscript

script Ai_ClearOrders 
	if containscomponent \{name = squadcommand}
		Squad_ClearOrders
	else
		Agent_ClearOrders
	endif
endscript

script Ai_SetBehavior 
	if containscomponent \{name = squadcommand}
		Squad_SetBehavior <...>
	else
		Agent_SetBehavior <...>
	endif
endscript

script Ai_SetLifeBehavior 
	if containscomponent \{name = squadcommand}
		soft_assert \{"life behavior can only be used on per agent basis"}
	else
		Agent_SetLifeBehavior <...>
	endif
endscript

script Ai_RunScript 
	if containscomponent \{name = squadcommand}
		Squad_RunScript <...>
	else
		<name> <params>
	endif
endscript

script Ai_GetSquadMembers 
	if containscomponent \{name = squadcommand}
		squad_getmembers
	else
		agent_getsquad
		<squad> :squad_getmembers
	endif
	return {members = <members>}
endscript

script Ai_GetNumSquadMembers 
	Ai_GetSquadMembers
	getarraysize \{members}
	return {squad_size = <array_size>}
endscript

script Ai_IsOnVehicle 
	if NOT gotparam name
		softassert "need name=id check Ai_IsOnVehicle"
		return false
	endif
	if gotparam name
		if NOT iscreated <name>
			return false
		endif
		if NOT <name> :containscomponent name = agent
			softassert "only use ai_isdead on ai"
			return false
		endif
		if ObjectIsHero <name>
			if NOT <name> :Ride_GetMountId
				return false
			endif
		else
			if NOT <name> :agent_islockedtovehicle
				return false
			endif
		endif
	endif
	return true
endscript

script Ai_MakeNoise radius = (BroadcastEventRanges.Broadcast_Noise)
	if NOT gotparam \{object}
		scriptassert \{"need id of noise maker (object=)"}
	endif
	<object> :broadcastevent {type = Broadcast_Noise
		radius = <radius>
		data = {attacker = <object>}}
endscript

script Ai_EnableGoalAgent 
	behavior_clearhierarchy \{hierarchy = reaction}
	AIInfo_DisableCanIgnite
	locator_setfootprint \{footprint = footprint_human_no_push}
endscript

script Ai_DisableGoalAgent 
	Bv_ReplaceHierarchy \{hierarchy = reaction
		state = Behavior_PedReactionBase}
	AIInfo_EnableCanIgnite
	locator_setfootprint \{footprint = footprint_human}
endscript

script Ai_EnableCriticalAgent \{invincible = true}
	if (<invincible> = true)
		AIInfo_SetInvincible
	endif
	AIInfo_DisableCanIgnite
	locator_setfootprint \{footprint = footprint_human_no_push}
	AIInfo_DisableCanBeTakenHostage
endscript

script Ai_DisableCriticalAgent 
	AIInfo_SetInvincible \{off}
	AIInfo_EnableCanIgnite
	locator_setfootprint \{footprint = footprint_human}
	AIInfo_EnableCanBeTakenHostage
endscript

script Locator_DisablePush 
	locator_setfootprint \{footprint = footprint_human_no_push}
endscript

script Locator_EnablePush 
	locator_setfootprint \{footprint = footprint_human}
endscript

script Ai_EnableVisionCheatOptimization 
	change \{enable_vision_cheating = 1}
endscript

script Ai_DisableVisionCheatOptimization 
	change \{enable_vision_cheating = 0}
endscript

script Ai_DisableInterestTests 
	if iscreated <object>
		<object> :agent_disableinteresttests
	endif
endscript

script Ai_EnableInterestTests 
	if iscreated <object>
		<object> :agent_enableinteresttests
	endif
endscript

script AI_IsDead 
	if NOT gotparam name
		if NOT gotparam names
			softassert "need array (names=[]) or name=id or name=squad_id to check Ai_IsDead"
			return false
		endif
	endif
	if gotparam name
		if Ai_IsDead_SingleObject name = <name>
			return true
		else
			return false
		endif
	endif
	if gotparam names
		getarraysize names
		if (<array_size> > 0)
			index = 0
			begin
			<obj> = (<names> [<index>])
			if NOT Ai_IsDead_SingleObject name = <obj>
				return false
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return true
endscript

script Ai_IsDead_SingleObject 
	if NOT iscreated <name>
		return true
	endif
	if <name> :containscomponent name = squadcommand
		<name> :squad_getmembers
		getarraysize members
		if (<array_size> > 0)
			return false
		else
			return true
		endif
	endif
	if <name> :containscomponent name = aiinfo
		if <name> :AIInfo_HasHealth
			return false
		else
			return true
		endif
	endif
	if NOT <name> :containscomponent name = HeroHealth
		softassert "only use ai_isdead on ai or hero"
		return false
	endif
	if NOT <name> :HeroHealth_IsDead
		return false
	endif
	return true
endscript

script Ai_GetFirstAlive 
	if NOT gotparam \{names}
		scriptassert \{"need names param"}
	endif
	getarraysize \{names}
	if (<array_size> > 0)
		index = 0
		begin
		<obj> = (<names> [<index>])
		if iscreated <obj>
			if <obj> :AIInfo_HasHealth
				return {alive = <obj>}
			endif
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Ai_KillIfDead 
	if NOT gotparam max_deaths
		<max_deaths> = 1000000
	endif
	if NOT gotparam name
		if NOT gotparam names
			scriptassert "need array (names=[]) or name=id or name=squad_id to kill if dead"
		endif
	endif
	<current_deaths> = 0
	if gotparam name
		if iscreated <name>
			if <name> :containscomponent name = squadcommand
				<name> :squad_getdeadmembers
				<names> = <members>
			else
				if NOT <name> :containscomponent name = aiinfo
					softassert "only use Ai_KillIfDead on ai"
					return false
				endif
				if NOT <name> :AIInfo_HasHealth
					<name> :die
				endif
			endif
		endif
	endif
	if gotparam names
		getarraysize names
		if (<array_size> > 0)
			index = 0
			begin
			<agent> = (<names> [<index>])
			if iscreated <agent>
				if NOT <agent> :containscomponent name = aiinfo
					softassert "only use Ai_KillIfDead on ai"
					return false
				endif
				if NOT <agent> :AIInfo_HasHealth
					<agent> :die
					<current_deaths> = (<current_deaths> + 1)
					if (<current_deaths> = <max_deaths>)
						break
					endif
				endif
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script Ai_EnableCutsceneMode 
	behavior_clearhierarchy \{hierarchy = reaction}
	behavior_clearhierarchy \{hierarchy = item}
	behavior_clearhierarchy \{hierarchy = life}
	behavior_clearhierarchy \{hierarchy = logic}
	behavior_clearhierarchy \{hierarchy = order}
	navcollision_enable \{off}
	locator_enable \{off}
	vision_enable \{off}
	navigation_enable \{off}
endscript

script Ai_EnableDeadMode 
	wait \{0.5
		seconds}
	behavior_clearhierarchy \{hierarchy = item}
	behavior_clearhierarchy \{hierarchy = life}
	behavior_clearhierarchy \{hierarchy = logic}
	behavior_clearhierarchy \{hierarchy = order}
	behavior_clearhierarchy \{hierarchy = animation}
	navcollision_enable \{off}
	fakeragdoll_enable \{off}
	locator_enable \{off}
	vision_enable \{off}
	navigation_enable \{off}
	seek_enable \{off}
	inventory_enable \{off}
endscript

script Ai_KillArray 
	if NOT gotparam names
		scriptassert "need array (names=[]) or name=id or name=squad_id to kill if dead"
	else
		getarraysize names
		if (<array_size> > 0)
			index = 0
			begin
			<agent> = (<names> [<index>])
			if iscreated <agent>
				if NOT <agent> :containscomponent name = aiinfo
					if ObjectIsHero <agent>
						if getglobalflag flag = cheat_invincible
							printf "___ can't kill invincible hero"
						else
							hero :obj_getposition
							launchevent type = shot target = hero data = {
								weapon = explosive_
								weapon_type = explosive_
								hit_bone = bone_thigh_l
								hit_pos = (<pos> + (0.0, 1.0, 0.0))
								source_pos = (<pos> + (0.0, 1.0, 0.0))
								hit_dir = (0.707, 0.707, 0.0)
								weapon_damage = 6000
								attacker = hero
							}
						endif
					else
						softassert "only use Ai_KillArray on ai or hero"
						return false
					endif
				else
					<agent> :die
				endif
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
	endif
endscript

script Ai_Gib 
	eventcache_add \{event_id = gib_death
		event_data = {
			attacker = unset
			orient_type = move
		}}
	obj_getposition
	if gotparam \{hit_dir}
		normalizevector <hit_dir>
		hit_dir = <norm>
	else
		GetRandomDirection
		hit_dir = <randomdirection>
	endif
	Gib weapon_type = unset hit_dir = <randomdirection> hit_pos = <pos>
endscript

script Ai_Setup_Ambient_Guard \{invincible = false
		prepare_dist = 5
		gain_attack = 10
		lose_attack = 12
		reward = true}
	if (<invincible> = false)
		AIInfo_SetInvincible \{off}
		AIInfo_SetHealth \{1.0}
	else
		AIInfo_SetInvincible \{on}
	endif
	agent_setinteractareas interact_areas = <areas>
	agent_addthreat \{name = player1}
	agent_setguarddistances \{prepare = 5
		gain_attack = 10
		lose_attack = 12}
	if (<reward> = true)
		obj_spawnscript \{check_guard_reward}
	endif
endscript

script check_guard_reward 
	blockuntilevent \{type = ragdoll_knockdown}
endscript
