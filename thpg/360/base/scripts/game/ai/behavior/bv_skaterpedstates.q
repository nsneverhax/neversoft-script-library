default_skater_anim_profile = {
	Move_NoItem_Skate_F_Push = [
		{
			in = PedMSk8_PushINIT
			range = PedMSk8_PushCycle
			out = PedMSk8_PushOut
		}
	]
	Move_NoItem_Grind = [
		{
			in = PedMSk8_5050fast
			range = PedMSk8_5050fast
			out = PedMSk8_5050fast
		}
		{
			in = PedMSk8_5050slow
			range = PedMSk8_5050slow
			out = PedMSk8_5050slow
		}
		{
			in = PedMSk8_NoseGrind
			range = PedMSk8_NoseGrind
			out = PedMSk8_NoseGrind
		}
	]
	Move_NoItem_Manual = [
		{
			in = PedMSk8_ManualINIT
			range = PedMSk8_Manual
			out = PedMSk8_PutDownManual
		}
		{
			in = PedMSk8_ManualINIT
			range = PedMSk8_ManualFast
			out = PedMSk8_PutDownManual
		}
		{
			in = PedMSk8_ManualINIT
			range = PedMSk8_NoseManual
			out = PedMSk8_PutDownManual
		}
	]
	Move_NoItem_GrabTrick = [
		{
			in = PedMSk8_BenihanaINIT
			range = PedMSk8_BenihanaIdle
			out = PedMSk8_BenihanaOut
		}
		{
			in = PedMSk8_BetweenTheLegsINIT
			range = PedMSk8_BetweenTheLegsIdle
			out = PedMSk8_BetweenTheLegsOut
		}
		{
			in = PedMSk8_ChristAirINIT
			range = PedMSk8_ChristAirIdle
			out = PedMSk8_ChristAirOut
		}
		{
			in = PedMSk8_SaranWrapINIT
			range = PedMSk8_SaranWrapIdle
			out = PedMSk8_SaranWrapOut
		}
	]
	Move_NoItem_LipTrick = [
		{
			in = PedMSk8_SadPlantINIT
			range = PedMSk8_SadPlantRange
			out = PedMSk8_SadPlantOut
		}
		{
			in = PedMSk8_TaiilboneINIT
			range = PedMSk8_TaiilboneRange
			out = PedMSk8_TaiilboneOut
		}
		{
			in = PedMSk8_1FtInvertINIT
			range = PedMSk8_1FtInvertRange
			out = PedMSk8_1FtInvertOut
		}
		{
			in = PedMSk8_KFAndrechtINIT
			range = PedMSk8_KFAndrechtRange
			out = PedMSk8_KFAndrechtOut
		}
		{
			in = PedMSk8_AndrechtInit
			range = PedMSk8_AndrechtRange
			out = PedMSk8_AndrechtOut
		}
	]
	Move_NoItem_Brake = PedMSk8_NewBrake
}

script RegisterBehaviors_SkaterPed 
	registerstate {
		name = Bv_FixedPathSkaterPed_Interact
		transitions =
		[
			{
				conditions = [{name = agent_hasvehicle result = true}]
				responses = [{replacement = this state = Bv_FixedPathSkaterPed_Interact_OnBoard}]
			}
		]
	}
	registerstate {
		name = Bv_FixedPathSkaterPed_Interact_OnBoard
		task =
		{
			name = task_skater
			params =
			{
				jump_gravity = -20
				finished_event_id = skater_path_finished
			}
		}
		transitions =
		[
			{
				events = [exit_behavior]
				responses = [{replacement = child state = SkaterAgent_FinishAnim}]
			}
			{
				events = [skater_path_finished]
				responses = [{replacement = this state = null}]
			}
			{
				events = [continue]
				responses = [{replacement = child state = Bv_FixedPathSkaterPed_Skating}]
			}
			{
				events = [stop]
				responses = [{replacement = child state = StateScript_sktrStop}]
			}
			{
				events = [Grind
					Vert_Grind]
				responses = [{replacement = child state = StateScript_sktrGrind}]
			}
			{
				events = [Grind_Off]
				responses = [{replacement = child state = StateScript_sktrGrindOff}]
			}
			{
				events = [Vert_Lip]
				responses = [{replacement = child state = StateScript_sktrLipTrick}]
			}
			{
				events = [skaterped_jumpaccel]
				responses = [{replacement = child state = StateScript_sktrJumpAccel}]
			}
			{
				events = [skaterped_jumpcrouch]
				responses = [{replacement = child state = StateScript_sktrJumpCrouch}]
			}
			{
				events = [Flip_Trick
					Vert_Flip]
				responses = [{replacement = child state = StateScript_sktrFlipTrick}]
			}
			{
				events = [Grab_Trick
					Vert_Grab]
				responses = [{replacement = child state = StateScript_sktrGrabTrick}]
			}
			{
				events = [jump
					Vert_Jump]
				responses = [{replacement = child state = StateScript_sktrJump}]
			}
			{
				events = [Vert_Land
					skaterped_land]
				responses = [{replacement = child state = StateScript_sktrLand}]
			}
			{
				events = [roll_off]
				responses = [{replacement = child state = StateScript_sktrRollOff}]
			}
			{
				events = [Manual]
				recur = true
				responses = [{replacement = child state = StateScript_sktrManual}]
			}
			{
				events = [manual_down]
				responses = [{replacement = child state = StateScript_sktrManualDown}]
			}
		]
	}
	registerstate {
		name = Bv_FixedPathSkaterPed
		transitions =
		[
			{
				conditions = [{name = agent_hasvehicle result = true}]
				responses = [{replacement = this state = Bv_FixedPathSkaterPed_OnBoard}]
			}
		]
	}
	registerstate {
		name = Bv_HealthFixedPathSkaterPed
		transitions =
		[
			{
				events = [enter_behavior]
				responses = [{replacement = child state = Bv_FixedPathSkaterPed}
					{replacement = damage state = Bv_HealthMonitor params = $bv_all_params}]
			}
		]
	}
	registerstate {
		name = Bv_FixedPathSkaterPed_OnBoard
		task =
		{
			name = task_skater
			params =
			{
				jump_gravity = -20
				finished_event_id = skater_path_finished
			}
		}
		transitions =
		[
			{events = [enter_behavior]
				responses = [{replacement = reaction
						state = Bv_ManageReactionState
						params = [{name = state val = bump}]
					}]
			}
			{
				events = [exit_behavior]
				responses = [{replacement = child state = SkaterAgent_FinishAnim}]
			}
			{
				events = [skater_path_finished]
				responses = [{replacement = this state = null}]
			}
			{
				events = [continue]
				responses = [{replacement = child state = Bv_FixedPathSkaterPed_Skating}]
			}
			{
				events = [stop]
				responses = [{replacement = child state = StateScript_sktrStop}]
			}
			{
				events = [Grind
					Vert_Grind]
				responses = [{replacement = child state = StateScript_sktrGrind}]
			}
			{
				events = [Grind_Off]
				responses = [{replacement = child state = StateScript_sktrGrindOff}]
			}
			{
				events = [Vert_Lip]
				responses = [{replacement = child state = StateScript_sktrLipTrick}]
			}
			{
				events = [skaterped_jumpaccel]
				responses = [{replacement = child state = StateScript_sktrJumpAccel}]
			}
			{
				events = [skaterped_jumpcrouch]
				responses = [{replacement = child state = StateScript_sktrJumpCrouch}]
			}
			{
				events = [Flip_Trick
					Vert_Flip]
				responses = [{replacement = child state = StateScript_sktrFlipTrick}]
			}
			{
				events = [Grab_Trick
					Vert_Grab]
				responses = [{replacement = child state = StateScript_sktrGrabTrick}]
			}
			{
				events = [jump
					Vert_Jump]
				responses = [{replacement = child state = StateScript_sktrJump}]
			}
			{
				events = [Vert_Land
					skaterped_land]
				responses = [{replacement = child state = StateScript_sktrLand}]
			}
			{
				events = [roll_off]
				responses = [{replacement = child state = StateScript_sktrRollOff}]
			}
			{
				events = [Manual]
				recur = true
				responses = [{replacement = child state = StateScript_sktrManual}]
			}
			{
				events = [manual_down]
				responses = [{replacement = child state = StateScript_sktrManualDown}]
			}
			{events = [bumped_small_finished
					bumped_big_finished
					bumped_knockdown_finished
					Ragdoll_Knockdown_Done]
				recur = true
				responses = [{replacement = child state = Bv_FixedPathSkaterPed_EquipSkateBoard}]
			}
		]
	}
	registerstate {
		name = Bv_FixedPathSkaterPed_EquipSkateBoard
		transitions =
		[
			{
				events = [enter_behavior]
				responses = [{replacement = child state = Bv_EquipSkateboard}]
			}
			{
				events = [bumped
					ragdoll_knockdown]
				responses = [{replacement = this state = null}]
			}
			{
				events = [AcquireVehicle_Finished
					AcquireVehicle_Failed]
				responses = [{replacement = child state = eventcache_add
						params = [{name = event_id val = skaterped_bump_finished}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_FixedPathSkaterPed_Skating
		transitions =
		[
			{
				events = [enter_behavior]
				responses = [{replacement = skate state = StateScript_sktrSkating}
					{replacement = push_event state = Bv_GenEvents_Push_Aggressive}]
			}
			{events = [Skater_Push]
				recur = true
				responses = [{replacement = push state = Bv_SkaterPed_Push}]
			}
		]
	}
	registerstate {
		name = Bv_SkaterFollowPathNodes
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						replacement = move
						state = Bv_FollowPathNodes
						params = [{name = start_node_id ref = start_node_id}]
					}
					{replacement = pushevent state = Bv_GenEvents_Push}
				]
			}
			{
				events = [Skater_Push]
				recur = true
				responses = [{replacement = push state = Bv_SkaterPed_Push}]
			}
		]
	}
endscript

script SkaterPed_GetAnimName {AnimType = 0}
	<anim_in> = 0
	<anim> = 0
	<anim_out> = 0
	if structurecontains <AnimType> structure = $default_skater_anim_profile
		<AnimAssets> = ($default_skater_anim_profile.<AnimType>)
		if isarray (<AnimAssets>)
			getrandomarrayelement (<AnimAssets>)
			if structurecontains range structure = <element>
				<anim_in> = (<element>.in)
				<anim> = (<element>.range)
				<anim_out> = (<element>.out)
			else
				<anim> = <element>
			endif
		else
			<anim> = <AnimAssets>
		endif
	endif
	if (<anim> = 0)
		printf ("WARNING: anim asset type '%s' not found for SkaterAgent_PlayAnim() call") s = <AnimType>
		return
	endif
	return anim = <anim> anim_in = <anim_in> anim_out = <anim_out>
endscript

script SkaterAgent_PlayAnim \{play_mode = once}
	finished_event_id = SkaterAgent_PlayAnim_Finished
	agent_playcustomanim {
		anim = <anim>
		play_mode = <play_mode>
		blend_period = 0.2
		motion_extract = false
		interrupt_event_id = SkaterAgent_PlayAnim_Interrupt
		finished_event_id = SkaterAgent_PlayAnim_Finished
	}
	if gotparam \{BlockUntilFinished}
		blockuntilevent \{type = SkaterAgent_PlayAnim_Finished}
	endif
endscript

script SkaterAgent_FinishAnim 
	agent_finishcustomanim
endscript

script StateScript_sktrSkating 
	SkaterAgent_FinishAnim
	spawnterrainsound \{action = roll}
endscript

script StateScript_sktrGrind 
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_Grind}
	settags {
		grind_init_anim = <anim_in>
		grind_range_anim = <anim>
		grind_out_anim = <anim_out>
	}
	spawnterrainsound \{action = grindon}
	SkaterAgent_PlayAnim anim = <anim> play_mode = loop BlockUntilFinished
endscript

script StateScript_sktrGrindOff 
	spawnterrainsound \{action = grindoff}
endscript

script StateScript_sktrJumpAccel 
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_Skate_F_Push}
	begin
	SkaterAgent_PlayAnim anim = <anim_in> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim_out> BlockUntilFinished
	repeat
endscript

script StateScript_sktrJumpCrouch 
	SkaterAgent_PlayAnim \{anim = Move_Skateboard_Stand_To_Crouch
		BlockUntilFinished}
	SkaterAgent_PlayAnim \{anim = Move_Skateboard_Idle_Crouch
		loop
		BlockUntilFinished}
endscript

script StateScript_sktrJump 
	spawnterrainsound \{action = ollie}
	SkaterAgent_PlayAnim \{anim = ollie
		BlockUntilFinished}
	SkaterAgent_PlayAnim \{anim = Ollie_Idle
		play_mode = loop
		BlockUntilFinished}
endscript

script StateScript_sktrFlipTrick 
	spawnterrainsound \{action = ollie}
	SkaterAgent_PlayAnim \{anim = ollie
		BlockUntilFinished}
	SkaterAgent_PlayAnim \{anim = fliptrick
		BlockUntilFinished}
	SkaterAgent_PlayAnim \{anim = Ollie_Idle
		play_mode = loop
		BlockUntilFinished}
endscript

script StateScript_sktrRollOff 
	SkaterAgent_FinishAnim
endscript

script StateScript_sktrGrabTrick 
	spawnterrainsound \{action = ollie}
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_GrabTrick}
	SkaterAgent_PlayAnim anim = <anim_in> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim_out> BlockUntilFinished
	SkaterAgent_PlayAnim \{anim = Ollie_Idle
		play_mode = loop
		BlockUntilFinished}
endscript

script StateScript_sktrLand 
	spawnterrainsound \{action = ollieland}
	SkaterAgent_PlayAnim \{anim = Ollie_Land
		BlockUntilFinished}
endscript

script StateScript_sktrStop 
	spawnterrainsound \{action = boardpickup}
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_Brake}
	SkaterAgent_PlayAnim anim = <anim> BlockUntilFinished
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_Brake}
	SkaterAgent_PlayAnim anim = <anim> BlockUntilFinished
	block
endscript

script StateScript_sktrManual 
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_Manual}
	settags manual_out_anim = <anim_out>
	skaterloopingsound_settag \{terrainsound_pedinmanual = true}
	SkaterAgent_PlayAnim anim = <anim_in> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim> play_mode = loop BlockUntilFinished
endscript

script StateScript_sktrManualDown 
	if NOT getsingletag \{manual_out_anim}
		<manual_out_anim> = PedMSk8_PutDownManual_F
	endif
	skaterloopingsound_settag \{terrainsound_pedinmanual = none}
	SkaterAgent_PlayAnim anim = <manual_out_anim> BlockUntilFinished
endscript

script StateScript_sktrLipTrick 
	SkaterPed_GetAnimName \{AnimType = Move_NoItem_LipTrick}
	SkaterAgent_PlayAnim anim = <anim_in> BlockUntilFinished
	SkaterAgent_PlayAnim anim = <anim> play_mode = loop
	if gotparam \{event_data}
		if structurecontains structure = <event_data> HoldLipTime
			<HoldLipTime> = ((<event_data>).HoldLipTime)
		endif
	endif
	if NOT gotparam \{HoldLipTime}
		<HoldLipTime> = RandomRange (1.0, 3.0)
	endif
	wait <HoldLipTime> seconds
	SkaterAgent_PlayAnim anim = <anim_out>
	eventcache_add \{event_id = skaterped_lip_finished}
endscript

script Bv_HealthMonitor \{damage = 20
		health = 100
		death_callback = none
		hit_callback = none}
	begin
	blockuntilevent \{anytypes = [
			ragdoll_knockdown
			lunge_collision
			shot_success
		]}
	<health> = (<health> - <damage>)
	if (<health> <= 0)
		if NOT (<death_callback> = none)
			<death_callback> <...>
		endif
	else
		if NOT (<hit_callback> = none)
			<hit_callback> <...>
		endif
	endif
	repeat
endscript
