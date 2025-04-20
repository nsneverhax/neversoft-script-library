Panic_MinWaitTime = 3.5
Panic_MaxWaitTime = 6.0

script RegisterPedPanicOnBaseLifeBehavior 
	registerstate {
		name = <new_behavior_name>
		transitions = [{events = [enter_behavior PanicLife_Finished]
				responses = [{replacement = life state = <base_life_behavior> params = $bv_all_params}
					{replacement = tdb state = <threat_detect_behavior>}
					{replacement = anm state = bv_blank}
					{replacement = time state = bv_blank}]
			}
			{events = [animalalert_dynamitedetection_front , animalalert_dynamitedetection_behind ,
					animalalert_noisedetection_high , animalalert_aimdetection]
				responses = [{replacement = life state = <panic_life_behavior>}
					{replacement = anm state = bv_blank}
					{replacement = tdb state = Bv_PanicBeacon}
					{replacement = time state = bv_blank}]
			}
			{events = [Panic_Spread broadcast_deathnearby grapple]
				responses = [{replacement = anm state = Bv_ProcessPanicEvent params = [{name = location ref = attacker}]}
					{replacement = life state = <panic_life_behavior>}
					{replacement = tdb state = Bv_PanicBeacon}
					{replacement = time state = bv_blank}]
			}
			{events = [animalalert_noisedetection_low , animalalert_noisedetection_mid]
				responses = [{replacement = life state = Bv_LookAt_Location}
					{replacement = tdb state = bv_blank}
					{replacement = anm state = Bv_PlayRetreatAnimSet
						params = [{name = anim_set_id val = Human_Move_Retreat}
							{name = anim_stage val = custom}
							{name = sync_start_time val = false}]}
					{replacement = time state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 1}
							{name = max_duration_secs val = 2}
							{name = event_id val = PanicLife_Finished}]}
				]
			}
		]
	}
endscript

script RegisterBehaviors_Panic 
	registerstate {
		name = Bv_DetectIndirectThreats
		task = {name = Task_DetectAnimalThreats
			params = {min_reaction_time = 0.0
				max_reaction_time = 0.2
				high_vol_dist = 12.5
				mid_vol_dist = 22.5
				low_vol_dist = 22.5
				aimed_at_dist = 4.75
				aimed_at_response_time = 4
				aimed_at_reset_time = 3.5
				aimed_at_angle = 75}}
	}
	registerstate {
		name = Bv_PanicLife_WaitForNoShots
		task = {name = Task_GenEvents_WaitAfterEvent
			params = {event_id = broadcast_shotfired
				finished_event_id = PanicLife_Finished
				min_time = Panic_MinWaitTime
				max_time = Panic_MaxWaitTime}}
		transitions = []}
	registerstate {
		name = Bv_PanicLife_Escape_DieWhenNotRendered
		transitions = [{events = [enter_behavior]
				responses = [{replacement = vis state = Bv_GenEvents_IsRendered}]
			}
			{events = [lost_isrendered]
				responses = [{replacement = time state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 3}
							{name = max_duration_secs val = 5}
							{name = event_id val = PanicLife_Die}]
					}
				]
			}
			{events = [got_isrendered]
				responses = [{replacement = time state = bv_blank}]
			}
			{events = [PanicLife_Die]
				responses = [
					{replacement = this state = Bv_InstantDeathAndCleanup}]
			}
		]
	}
	registerstate {
		name = Bv_PanicLife_Escape
		transitions = [{events = [enter_behavior , PanicLife_EscapeLook_Finished]
				responses = [{replacement = move state = Bv_MoveAwayToMaxDist_Loop_Location
						params = [{name = movement_desc val = {movement = run_fast
									mode = stand
									stop_distance = 0.5
									arrival_distance = 0.625
									stopping_distance = 1.25}}
							{name = max_distance val = RandomNoRepeat (@ 30 , @ 50 , @ 40 , @ 20 )}
							{name = finished_event_id val = PanicLife_Escape_Finished}]}
					{replacement = voice state = playvoiceoverbyevent params = [{name = event_id val = fleeing}]}
					{replacement = veh state = Bv_PanicLife_ControlMovementMode}
					{replacement = time state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 15}
							{name = max_duration_secs val = 25}
							{name = event_id val = PanicLife_Escape_Finished}]
					}
					{replacement = die state = Bv_PanicLife_Escape_DieWhenNotRendered}
				]
			}
			{events = [PanicLife_Escape_Finished]
				responses = [{replacement = move state = Bv_LookAt_Location}
					{replacement = shot state = Bv_PanicLife_WaitForNoShots}
					{replacement = time state = Bv_GenEvents_Timer
						params = [{name = min_duration_secs val = 3}
							{name = max_duration_secs val = 3}
							{name = event_id val = PanicLife_EscapeLook_Finished}]
					}]
			}
		]
	}
	registerstate {
		name = Bv_PanicLife_ControlMovementMode
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_GenEvents_IsRider}
					{replacement = dtct state = Bv_DetectAndAcquireVehicles}]
			}
			{events = [Lost_IsRider]
				responses = [{replacement = child state = Bv_PanicLife_ControlMovementMode_Ground}]
			}
			{events = [Got_IsRider]
				responses = [{replacement = child state = Bv_PanicLife_ControlMovementMode_Vehicle}]
			}]
	}
	registerstate {
		name = Bv_PanicLife_ControlMovementMode_Ground
		transitions = [{events = [enter_behavior]
				responses = [{replacement = anm state = Bv_PlayRetreatAnimSet
						params = [{name = anim_set_id val = Human_Move_Retreat}
							{name = anim_stage val = custom}
							{name = sync_start_time val = false}]}]
			}
			{events = [Got_DetectVehicle]
				responses = [{replacement = this state = Bv_PanicLife_ControlMovementMode_Vehicle}]
			}
		]
	}
	registerstate {
		name = Bv_PanicLife_ControlMovementMode_Vehicle
		transitions = [{events = [Lost_IsRider , ReleaseVehicle_Finished , ReleaseVehicle_Failed]
				responses = [{replacement = this state = Bv_PanicLife_ControlMovementMode_Ground}]
			}
		]
	}
	registerstate {
		name = Bv_ShowdownPanicLife_Escape_DieWhenNotRendered
		transitions = [{events = [enter_behavior]
				responses = [{replacement = vis state = Bv_GenEvents_IsRendered}]
			}
			{events = [lost_isrendered]
				responses = [
					{replacement = this state = Bv_InstantDeathAndCleanup}]
			}
		]
	}
	registerstate {
		name = Bv_ShowdownPanicMoveTo
		transitions = [{events = [enter_behavior]
				responses = [{replacement = move state = Bv_MoveTo params = $bv_all_params}
					{replacement = anm state = Bv_PlayRetreatAnimSet
						params = [{name = anim_set_id val = Human_Move_Retreat}
							{name = anim_stage val = custom}
							{name = sync_start_time val = false}]}]
			}
		]
	}
endscript

script Bv_PanicBeacon 
	<panic_beacon_radius> = 7.5
	Interest_GetLocation
	begin
	if NOT gotparam \{location}
		eventcache_add \{event_id = PanicLife_Finished}
		break
	endif
	if NOT obj_hascomponent \{locator}
		eventcache_add \{event_id = PanicLife_Finished}
		break
	endif
	getspeed
	if (<speed> > 0.025)
		broadcastevent {type = Panic_Spread
			radius = <panic_beacon_radius>
			data = {attacker = <location>}}
	endif
	wait \{1
		second}
	repeat
endscript

script Bv_ProcessPanicEvent 
	if gotparam \{location}
		if iscreated <location>
			if <location> :obj_hascomponent locator
				Interest_SetLocation location = <location>
			endif
		endif
	endif
endscript
