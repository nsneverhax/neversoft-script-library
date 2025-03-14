DEF_ESCAPE_DIST = 500

script RegisterStyleBehavior 
	AppendStringToChecksum {result_var = new_behavior_name_default checksum = <new_behavior_name> string = "_default"}
	AppendStringToChecksum {result_var = new_behavior_name_no_threat checksum = <new_behavior_name> string = "_no_threat"}
	AppendStringToChecksum {result_var = new_behavior_name_exposed_threat checksum = <new_behavior_name> string = "_exposed_threat"}
	AppendStringToChecksum {result_var = new_behavior_name_concealed_threat checksum = <new_behavior_name> string = "_concealed_threat"}
	AppendStringToChecksum {result_var = new_behavior_name_lost_threat checksum = <new_behavior_name> string = "_lost_threat"}
	AppendStringToChecksum {result_var = new_behavior_name_suspicion checksum = <new_behavior_name> string = "_suspicion"}
	AppendStringToChecksum {result_var = new_behavior_name_lost_suspicion checksum = <new_behavior_name> string = "_lost_suspicion"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_dynamite checksum = <new_behavior_name> string = "_escape_dynamite"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_full_trample checksum = <new_behavior_name> string = "_escape_full_trample"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_potential_trample checksum = <new_behavior_name> string = "_escape_potential_trample"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_dynamite_combat checksum = <new_behavior_name> string = "_escape_dynamite_combat"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_full_trample_combat checksum = <new_behavior_name> string = "_escape_full_trample_combat"}
	AppendStringToChecksum {result_var = new_behavior_name_escape_potential_trample_combat checksum = <new_behavior_name> string = "_escape_potential_trample_combat"}
	if NOT gotparam escape_dynamite_behavior
		escape_dynamite_behavior = Bv_EscapeDynamite
	endif
	if NOT gotparam escape_full_trample_behavior
		escape_full_trample_behavior = Bv_EscapeFullTrample_Dodge
	endif
	if NOT gotparam escape_potential_trample_behavior
		escape_potential_trample_behavior = Bv_EscapePotentialTrample_Move
	endif
	if NOT gotparam escape_dynamite_combat_behavior
		escape_dynamite_combat_behavior = Bv_EscapeDynamite_Combat
	endif
	if NOT gotparam escape_full_trample_combat_behavior
		escape_full_trample_combat_behavior = Bv_EscapeFullTrample_CombatDodge
	endif
	if NOT gotparam escape_potential_trample_combat_behavior
		escape_potential_trample_combat_behavior = Bv_EscapePotentialTrample_CombatMove
	endif
	registerstate {
		name = <new_behavior_name>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = areaset
						state = agent_setareas
						params = [{name = combat_areas ref = combat_areas}
							{name = search_areas ref = search_areas}
							{name = center ref = center}
							{name = center_dist ref = center_dist}]
					}
					{replacement = monitorsearchstatus
						state = Bv_MonitorSearchStatus
						params = [{name = search_areas ref = search_areas}]
					}
					{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
					{replacement = detect
						state = <detection_behavior>
					}
					{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id ref = behavior_life_id}
							{name = behavior_life_id val = <life_behavior>}
							{name = behavior_life_params ref = behavior_life_params}
						]
					}
					{replacement = child
						state = <new_behavior_name_default>
					}
				]
			}
		]}
	registerstate {
		name = <new_behavior_name_default>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = this state = <new_behavior_name_exposed_threat>}]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_no_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <no_threat_behavior>}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = foundhim}]
					}
					{replacement = this state = <new_behavior_name_exposed_threat>}
				]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_exposed_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <exposed_threat_behavior>}
					{replacement = detect state = Bv_DetectVehicles}]
			}
			{events = [Got_DetectVehicle] ,
				recur = true
				responses = [{replacement = child
						state = Bv_EnterVehicle
						params = [{name = attach_type val = driver}]
					}]
			}
			{events = [Lost_DetectVehicle] ,
				responses = [{replacement = child state = <exposed_threat_behavior>}]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite_combat>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample_combat>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample_combat>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_concealed_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <concealed_threat_behavior>}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = foundhim}]
					}
					{replacement = this state = <new_behavior_name_exposed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_lost_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <lost_threat_behavior>}
					{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = searching}]
					}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = foundhim}]
					}
					{replacement = this state = <new_behavior_name_exposed_threat>}]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = giveupsearch}]
					}
					{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_suspicion>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <suspicion_behavior>}
					{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = hearing}]
					}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = foundhim}]
					}
					{replacement = this state = <new_behavior_name_exposed_threat>}]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_LostSuspicion]
				responses = [{replacement = this state = <new_behavior_name_lost_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_lost_suspicion>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_GenEvents_AlertState}
					{replacement = child state = <lost_suspicion_behavior>}]
			}
			{events = [alertstate_exposedthreat]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = foundhim}]
					}
					{replacement = this state = <new_behavior_name_exposed_threat>}]
			}
			{events = [AlertState_ConcealedThreat]
				responses = [{replacement = this state = <new_behavior_name_concealed_threat>}]
			}
			{events = [alertstate_lostthreat]
				responses = [{replacement = this state = <new_behavior_name_lost_threat>}]
			}
			{events = [AlertState_Suspicion]
				responses = [{replacement = this state = <new_behavior_name_suspicion>}]
			}
			{events = [alertstate_none]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = giveupsearch}]
					}
					{replacement = this state = <new_behavior_name_no_threat>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_dynamite>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [
					{replacement = child state = <escape_dynamite_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_full_trample>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = onhorse}]
					}
					{replacement = child state = <escape_full_trample_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_potential_trample>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = <escape_potential_trample_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_dynamite_combat>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [
					{replacement = child state = <escape_dynamite_combat_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_full_trample_combat>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = voice
						state = playvoiceoverbyevent
						params = [{name = event_id val = onhorse}]
					}
					{replacement = child state = <escape_full_trample_combat_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
		]}
	registerstate {
		name = <new_behavior_name_escape_potential_trample_combat>
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = <escape_potential_trample_combat_behavior>}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = <new_behavior_name_default>}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = <new_behavior_name_escape_dynamite_combat>}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_full_trample_combat>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = <new_behavior_name_escape_potential_trample_combat>}]
			}
		]}
endscript

script RegisterBehaviors_Styles 
	registerstate {
		name = Bv_StatsBehaviorInterface
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = this
						state = Bv_RunStatsCustomBehavior
						params =
						[
							{name = type ref = stats_custom_behavior_type}
							{name = params ref = all_params}
						]
					}
				]
			}
		]
	}
	RegisterAnimalStyles
	RegisterStyleBehavior {new_behavior_name = Style_Balanced_Unbound
		exposed_threat_behavior = Bv_DelayedBalancedCombat_Prefer
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Balanced
		exposed_threat_behavior = Bv_DelayedBalancedCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Cautious_Unbound
		exposed_threat_behavior = Bv_DelayedCautiousCombat_Prefer
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Cautious
		exposed_threat_behavior = Bv_DelayedCautiousCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Aggressive_Unbound
		exposed_threat_behavior = Bv_DelayedOffensiveCombat_Prefer
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Aggressive
		exposed_threat_behavior = Bv_DelayedOffensiveCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Cowardly_Unbound
		exposed_threat_behavior = Bv_DelayedDefensiveCombat_Prefer
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Cowardly
		exposed_threat_behavior = Bv_DelayedDefensiveCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Retreat_Unbound
		exposed_threat_behavior = Bv_DelayedDefensiveRetreatCombat_Prefer
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Retreat
		exposed_threat_behavior = Bv_DelayedDefensiveRetreatCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_AutoFire
		exposed_threat_behavior = Bv_SimpleAimCombat_AllItems
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = bv_stand
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_AutoFire_NoEscape
		exposed_threat_behavior = Bv_SimpleAimCombat_AllItems
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = bv_stand
		detection_behavior = Bv_Style_CommonDetection_NoEscape
	}
	RegisterStyleBehavior {new_behavior_name = Style_Aggressive_NoEscape
		exposed_threat_behavior = Bv_DelayedOffensiveCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection_NoEscape
	}
	RegisterStyleBehavior {new_behavior_name = Style_Cowardly_NoEscape
		exposed_threat_behavior = Bv_DelayedDefensiveCombat_Guard
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = bv_stand
		detection_behavior = Bv_Style_CommonDetection_NoEscape
	}
	RegisterStyleBehavior {new_behavior_name = Style_VehicleCrouchCover
		exposed_threat_behavior = Bv_VehicleCombat_CrouchCover
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = bv_stand
		detection_behavior = Bv_Style_CommonDetection_NoEscape
	}
	RegisterPedPanicOnBaseLifeBehavior {new_behavior_name = Bv_PanicPedLife
		base_life_behavior = Bv_PedLife
		panic_life_behavior = Bv_PanicLife_Escape
		threat_detect_behavior = Bv_DetectIndirectThreats
	}
	RegisterStyleBehavior {new_behavior_name = Style_Pedlife_Aggressive
		exposed_threat_behavior = Bv_ExitLife_Aggressive
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PanicPedLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Pedlife_Aggressive_Bound
		exposed_threat_behavior = Bv_ExitLife_Aggressive_Bound
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PanicPedLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Pedlife_Passive
		exposed_threat_behavior = Bv_ExitLife_Passive
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PanicPedLife
		detection_behavior = Bv_Style_CommonDetection
	}
	RegisterStyleBehavior {new_behavior_name = Style_Bear
		exposed_threat_behavior = Bv_Combat_Bear
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_BearDetection
		escape_dynamite_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_behavior = Bv_EscapePotentialTrample_Move
		escape_dynamite_combat_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_combat_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_combat_behavior = Bv_EscapePotentialTrample_Move
	}
	RegisterStyleBehavior {new_behavior_name = Style_Pedlife_Wolf
		exposed_threat_behavior = Bv_ExitLife_Wolf
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PedLife
		detection_behavior = Bv_Style_CommonDetection
		escape_dynamite_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_behavior = Bv_EscapePotentialTrample_Move
		escape_dynamite_combat_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_combat_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_combat_behavior = Bv_EscapePotentialTrample_Move
	}
	RegisterStyleBehavior {new_behavior_name = Style_Pedlife_Coyote
		exposed_threat_behavior = Bv_ExitLife_Coyote
		concealed_threat_behavior = Bv_Investigate
		lost_threat_behavior = Bv_SearchAndClearAlert
		suspicion_behavior = Bv_Investigate
		lost_suspicion_behavior = Bv_SearchAndClearAlert
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PedLife
		detection_behavior = Bv_Style_CommonDetection
		escape_dynamite_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_behavior = Bv_EscapePotentialTrample_Move
		escape_dynamite_combat_behavior = Bv_EscapeDynamite_Move
		escape_full_trample_combat_behavior = Bv_EscapeFullTrample_Move
		escape_potential_trample_combat_behavior = Bv_EscapePotentialTrample_Move
	}
	RegisterStyleBehavior {new_behavior_name = Style_Hollister
		exposed_threat_behavior = Bv_Hollister_Combat
		concealed_threat_behavior = Bv_Hollister_Dynamite
		lost_threat_behavior = Bv_Hollister_Search
		suspicion_behavior = Bv_Hollister_Dynamite
		lost_suspicion_behavior = Bv_Hollister_Search
		no_threat_behavior = Bv_Hollister_Life
		life_behavior = Bv_DefaultLife
		detection_behavior = Bv_Style_CommonDetection
	}
	registerstate {
		name = Style_DetectThreats
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection
					}
					{replacement = alert
						state = Bv_GenEvents_AlertState
					}
					{replacement = areaset
						state = agent_setareas
						params = [{name = combat_areas ref = combat_areas}
							{name = search_areas ref = search_areas}
							{name = center ref = center}
							{name = center_dist ref = center_dist}]
					}
					{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id ref = behavior_life_id}
							{name = behavior_life_id val = Bv_DefaultLife}
							{name = behavior_life_params ref = behavior_life_params}
						]
					}
					{replacement = child
						state = Bv_RunLifeWithItems
					}
				]
			}
		]}
	registerstate {
		name = Style_FollowPath
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection}
					{replacement = child
						state = Bv_ManagedFollowPath
						params = [{name = finished_event_id ref = finished_event_id}
							{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = arrival_movement_desc ref = arrival_movement_desc}]}
				]}
		]
	}
	registerstate {
		name = Style_MoveTo_Hoodoo
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection}
					{replacement = child
						state = Bv_MoveTo_Hoodoo
						params = [{name = finished_event_id ref = finished_event_id}
							{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}]}
				]}
		]
	}
	registerstate {
		name = Bv_MoveTo_Hoodoo
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child
						state = Bv_MoveTo
						params = [{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = finished_event_id ref = finished_event_id}]
					}
					{replacement = detect
						state = Bv_DetectAndAcquireVehicles}
					{replacement = equip
						state = Bv_EnableItemControlEquip}
					{replacement = reload
						state = Bv_EnableItemControlReload}
					{replacement = prox_events
						state = Bv_GenEvents_ShouldProximityAttack}
				]
			}
			{events = [got_shouldproximityattack] ,
				responses = [{replacement = this
						state = Bv_Hoodoo_Proximity_Attack
						params = $bv_all_params}]
			}
		]
	}
	registerstate {
		name = Bv_Hoodoo_Proximity_Attack
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = aim
						state = Bv_AimAt_Target}
					{replacement = attack
						state = Bv_ProximityAttack}]
			}
			{events = [ProximityAttack_Finished] ,
				responses = [{replacement = this
						state = Bv_MoveTo_Hoodoo
						params = $bv_all_params}]
			}
		]
	}
	registerstate {
		name = Style_AggressiveCombatNode_Locked
		task = {name = Task_UseAreaNode
			params = {
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = AreaNode state = Bv_GenEvents_ActiveAreaNode}
					{replacement = detect state = Bv_Style_CommonDetection}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
				]
			}
			{events = [Got_ActiveAreaNode] ,
				responses = [{replacement = use state = Bv_CombatNode_FightCallMoveToAndCallFiring}]
			}
			{events = [Lost_ActiveAreaNode] ,
				responses = [{replacement = use state = bv_blank}]
			}
		]
	}
	registerstate {
		name = Style_AggressiveCombatNode_Free
		task = {name = Task_UseAreaNode
			params = {
			}
		}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = detect state = Bv_Style_CommonDetection}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
					{replacement = child state = Style_AggressiveCombatNode_Unlocked_Default}
				]
			}
		]
	}
	registerstate {
		name = Style_AggressiveCombatNode_Unlocked_Default
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = AreaNode state = Bv_GenEvents_ActiveAreaNode}]
			}
			{events = [Got_ActiveAreaNode] ,
				responses = [{replacement = use state = Bv_CombatNode_FightCallMoveToAndCallFiring}]
			}
			{events = [Lost_ActiveAreaNode] ,
				responses = [{replacement = use state = bv_blank}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Escape_Dynamite}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Full_Trample_Danger}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Potential_Trample_Danger}]
			}
		]
	}
	registerstate {
		name = Style_AggressiveCombatNode_Unlocked_Escape_Dynamite
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapeDynamite}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Default}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Escape_Dynamite}]
			}
		]}
	registerstate {
		name = Style_AggressiveCombatNode_Unlocked_Full_Trample_Danger
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapeFullTrample}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Default}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Escape_Dynamite}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Full_Trample_Danger}]
			}
		]}
	registerstate {
		name = Style_AggressiveCombatNode_Unlocked_Potential_Trample_Danger
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapePotentialTrample}]
			}
			{events = [escape_danger_finished]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Default}]
			}
			{events = [escape_dynamite]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Escape_Dynamite}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Full_Trample_Danger}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = this state = Style_AggressiveCombatNode_Unlocked_Potential_Trample_Danger}]
			}
		]}
	registerstate {
		name = Style_DetectAndAcquireVehicles
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection}
					{replacement = child
						state = Bv_DetectAndAcquireVehicles}
				]}
		]
	}
	registerstate {
		name = Style_FollowPathCombat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
					{replacement = detect
						state = Bv_Style_CommonDetection
					}
					{replacement = move
						state = Bv_ManagedFollowPath
						params = [{name = finished_event_id ref = finished_event_id}
							{name = waypoint ref = waypoint}
							{name = arrival_movement_desc ref = arrival_movement_desc}
							{name = movement_desc ref = movement_desc}]}
					{replacement = combat
						state = Bv_SimpleAimCombat_AllItems}
				]}
		]
	}
	registerstate {
		name = Style_FollowPathNodesCombat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
					{replacement = detect
						state = Bv_Style_CommonDetection
					}
					{replacement = move
						state = Bv_FollowPathNodes
						params = [{name = start_node_id ref = start_node_id}]}
					{replacement = combat
						state = Bv_SimpleAimCombat_AllItems}
				]}
		]
	}
	registerstate {
		name = Style_VehiclePathCombat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = style
						state = Style_FollowPathCombat
						params = [{name = threats ref = threats}
							{name = waypoint ref = waypoint}
							{name = movement_desc ref = movement_desc}
							{name = arrival_movement_desc ref = arrival_movement_desc}
							{name = finished_event_id ref = finished_event_id}]
					}
				]
			}
			{events = [ReleaseVehicle_Finished ReleaseVehicle_Failed]
				responses = [{replacement = style
						state = bv_runbehavior
						params = [{name = behavior_id ref = on_foot_behavior_id}
							{name = behavior_id val = Style_Cautious}
							{name = behavior_params ref = all_params}]
					}
				]
			}
		]
	}
	registerstate {
		name = Style_VehiclePathNodesCombat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = style
						state = Style_FollowPathNodesCombat
						params = [{name = threats ref = threats}
							{name = start_node_id ref = start_node_id}]
					}
				]
			}
			{events = [ReleaseVehicle_Finished ReleaseVehicle_Failed]
				responses = [{replacement = style
						state = bv_runbehavior
						params = [{name = behavior_id ref = on_foot_behavior_id}
							{name = behavior_id val = Style_Cautious}
							{name = behavior_params ref = all_params}]
					}
				]
			}
		]
	}
	registerstate {
		name = Style_MaintainCombatNodes
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection
					}
					{replacement = areaset
						state = agent_setareas
						params = [{name = combat_areas ref = combat_areas}
							{name = center ref = center}
							{name = center_dist ref = center_dist}]
					}
					{replacement = this
						state = Bv_DefaultLife
					}
				]
			}
		]
	}
	registerstate {
		name = Style_Follow
		transitions = [{events = [enter_behavior]
				responses = [{replacement = detect
						state = Bv_Style_CommonDetection
					}
					{replacement = areaset
						state = agent_setareas
						params = [{name = location ref = location}]
					}
					{replacement = this
						state = bv_moveto_loop_location
						params = [{name = relative_offset_type ref = relative_offset_type}
							{name = relative_offset ref = relative_offset}
							{name = finished_event_id ref = finished_event_id}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Hollister_Life
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_RunLifeWithItems}
					{replacement = radar state = RadarForceHide}
					{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = primaryweapon}]
					}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = reload state = Bv_EnableItemControlReload}
					{replacement = debug
						state = bv_message
						params = [{name = message val = "!!!!!!!!!!!!!!!!!! Bv_Hollister_Life !!!!!!!!!!!!!!!!!!!!"}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Hollister_Combat
		transitions = [{events = [enter_behavior]
				responses = [{replacement = radar state = RadarForceHideClear}
					{replacement = prox_events state = Bv_GenEvents_ShouldProximityAttack}
					{replacement = combat state = Bv_SimpleAimCombat_AllItems}
					{replacement = move state = Bv_Hollister_Combat_Move_GotClearAim}
					{replacement = dodge state = Bv_DodgeReactions}
					{replacement = stand state = bv_stand}
					{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = primaryweapon}]
					}
				]}
			{events = [got_shouldproximityattack] ,
				responses = [{replacement = this state = Bv_Hollister_Combat_ProximityAttack}]}
		]}
	registerstate {
		name = Bv_Hollister_Combat_ProximityAttack
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = aim state = Bv_AimAt_Target}
					{replacement = attack state = Bv_ProximityAttack}]}
			{events = [ProximityAttack_Finished] ,
				responses = [{replacement = this state = Bv_Hollister_Combat}]}
		]}
	Hollister_Combat_Move_LostClearAim_MoveDesc = {
		id = Hollister_Combat_Move_GotClearAim_MoveDesc
		movement = run_fast
		stop_distance = 1.25
		arrival_distance = 1.25
		departure_distance = 1.5
		point_arrival_distance = 0.75
		stopping_distance = 0.5
		starting_distance = 0.5
		outside_boundary = arrive
		path_find = shortest
		mode = stand
	}
	Hollister_Combat_Move_GotClearAim_MoveDesc = {
		id = Hollister_Combat_Move_LostClearAim_MoveDesc
		movement = run_fast
		stop_distance = 10
		arrival_distance = 10.25
		departure_distance = 10
		point_arrival_distance = 0.75
		stopping_distance = 0.5
		starting_distance = 0.5
		outside_boundary = arrive
		path_find = shortest
		mode = stand
	}
	registerstate {
		name = Bv_Hollister_Combat_Move_GotClearAim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_MoveTo_Loop_Enemy
						params = [{name = movement_desc val = <Hollister_Combat_Move_GotClearAim_MoveDesc>}]
					}
				]}
			{conditions = [{name = agent_hasclearaim result = false}]
				responses = [{replacement = this state = Bv_Hollister_Combat_Move_LostClearAim}]}
		]}
	registerstate {
		name = Bv_Hollister_Combat_Move_LostClearAim
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_MoveTo_Loop_Enemy
						params = [{name = movement_desc val = <Hollister_Combat_Move_LostClearAim_MoveDesc>}]
					}
				]
			}
			{conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_Hollister_Combat_Move_GotClearAim}]
			}
		]}
	registerstate {
		name = Bv_Hollister_Search
		transitions = [{events = [enter_behavior]
				responses = [{replacement = radar state = RadarForceHideClear}
					{replacement = child state = Bv_SearchAndClearAlert}
					{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = primaryweapon}]
					}
					{replacement = debug
						state = bv_message
						params = [{name = message val = "!!!!!!!!!!!!!!!!!! Bv_Hollister_Search !!!!!!!!!!!!!!!!!!!!"}]
					}
				]
			}
		]}
	registerstate {
		name = Bv_Hollister_Dynamite
		task = {name = Task_GenEvents_NumUses
			params = {min_num_uses = 3
				max_num_uses = 3
				event_id = Hollister_Dynamite_Finished}}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = radar
						state = RadarForceHideClear}
					{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = secondaryweapon}]
					}
					{replacement = equip
						state = Bv_EnableItemControlEquip}
					{replacement = reload
						state = Bv_EnableItemControlReload}
					{replacement = use
						state = Bv_UseEquippedItem_Loop}
					{replacement = aim
						state = Bv_AimAt_Investigate}
				]}
			{events = [Hollister_Dynamite_Finished
					lost_interest_investigate]
				responses = [{replacement = this state = Bv_Hollister_Taunt}]}
		]}
	registerstate {
		name = Bv_Hollister_Taunt
		transitions = [{events = [enter_behavior]
				responses = [{replacement = radar
						state = RadarForceHideClear}
					{replacement = anim
						state = Bv_PlayAnimSet
						params = [{name = anim_set_id val = Human_Taunt}
							{name = anim_stage val = custom}
							{name = sync_start_time val = false}
							{name = finished_event_id val = TauntAnim_Finished}
						]}
					{replacement = aim
						state = Bv_AimAt_Investigate}
				]}
			{events = [TauntAnim_Finished]
				responses = [{replacement = this state = Bv_Hollister_Investigate}]}
		]}
	registerstate {
		name = Bv_Hollister_Investigate
		transitions = [{events = [enter_behavior]
				responses = [{replacement = radar state = RadarForceHideClear}
					{replacement = child state = Bv_Investigate}
					{replacement = items
						state = itemcontrol_setequipitemtypefilter
						params = [{name = item_type_id val = primaryweapon}]
					}
				]
			}
		]}
	registerstate {
		name = Bv_Style_Wolf
		transitions = [{events = [enter_behavior]
				responses = [{replacement = areaset
						state = agent_setareas
						params = [{name = combat_areas ref = combat_areas}
							{name = search_areas ref = search_areas}
							{name = center ref = center}
							{name = center_dist ref = center_dist}]
					}
					{replacement = monitorsearchstatus
						state = Bv_MonitorSearchStatus
						params = [{name = search_areas ref = search_areas}]
					}
					{replacement = preferredthreats
						state = Agent_AddThreats
						params = [{name = threats ref = threats}]
					}
					{replacement = detect
						state = Bv_Style_PersistentDetection_Animal
					}
					{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id ref = behavior_life_id}
							{name = behavior_life_id val = Bv_Wander}
							{name = behavior_life_params ref = behavior_life_params}
						]
					}
				]}
			{events = [got_interest_enemy]
				responses = [{replacement = life
						state = Bv_Combat_Wolf
					}]
			}
			{events = [lost_interest_enemy]
				responses = [{replacement = life
						state = Bv_Wander}]
			}]
	}
endscript

script RegisterCommonDetectionBehaviors 
	registerstate {
		name = Bv_Style_CommonDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = detect_vis state = Bv_DetectThreats}
					{replacement = enemy_int state = Bv_GenEvents_Interest_Enemy}
					{replacement = invst_int state = Bv_GenEvents_Interest_Investigate}
					{replacement = help state = Bv_ManageRequestHelp}
					{replacement = assistance state = Bv_ManageRequestAssistance}
					{replacement = hostage state = Bv_ManageHostage}
					{replacement = dyno state = Bv_ManageDynamite}
					{replacement = trample state = Bv_DetectTrampleDanger}
					{replacement = vo state = Bv_CombatTalker}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_BearDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = enemy_int state = Bv_GenEvents_Interest_Enemy}
					{replacement = detect_vis state = Bv_DetectThreats}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_CommonAnimalDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = enemy_int state = Bv_GenEvents_Interest_Enemy}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_CommonDetection_NoEscape
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = detect_vis state = Bv_DetectThreats}
					{replacement = enemy_int state = Bv_GenEvents_Interest_Enemy}
					{replacement = invst_int state = Bv_GenEvents_Interest_Investigate}
					{replacement = help state = Bv_ManageRequestHelp}
					{replacement = assistance state = Bv_ManageRequestAssistance}
					{replacement = hostage state = Bv_ManageHostage}
					{replacement = vo state = Bv_CombatTalker}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_PersistentDetection_NoEscape
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = detect_vis state = Bv_DetectThreats}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_PersistentDetection_Animal
		transitions = [{events = [enter_behavior]
				responses = [{replacement = variance state = Bv_GenEvents_Variance}
					{replacement = enemy state = Bv_GenEvents_Interest_Enemy}
					{replacement = detect_vis state = Bv_DetectThreats}
				]
			}
		]
	}
	registerstate {
		name = Bv_Style_GeneralDetection
		transitions = [{events = [enter_behavior]
				responses = [{replacement = nmeint state = Bv_GenEvents_Interest_Enemy}
					{replacement = invint state = Bv_GenEvents_Interest_Investigate}
					{replacement = help state = Bv_ManageRequestHelp}
					{replacement = assistance state = Bv_ManageRequestAssistance}
					{replacement = hostage state = Bv_ManageHostage}
				]
			}
		]
	}
endscript

script RegisterAnimalStyles 
	registerstate {
		name = Bv_AnimalProcessPotentialTrample
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapePotentialTrample_Move}]
			}
		]
	}
	registerstate {
		name = Bv_AnimalProcessFullTrample
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapeFullTrample_Move}]
			}
		]
	}
	registerstate {
		name = Bv_AnimalProcessWagonTrample
		task = {name = Task_ProcessEscapeDangerEvent}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_EscapeWagon_Move}]
			}
		]
	}
	RegisterAnimalStyleBehaviors {new_behavior_name = Style_Pedlife_Animal_Passive
		new_behavior_name_threat = Style_Pedlife_Animal_Passive_Threat
		new_behavior_name_no_threat = Style_Pedlife_Animal_Passive_Life
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PedLife
		dynamite_front_behavior = Bv_Animal_GenericThreatResponse
		dynamite_behind_behavior = Bv_Animal_GenericThreatResponse
		noise_detection_low_behavior = Bv_Animal_GenericThreatResponse
		noise_detection_mid_behavior = Bv_Animal_GenericThreatResponse
		noise_detection_high_behavior = Bv_Animal_GenericThreatResponse
	}
	RegisterAnimalStyleBehaviors {new_behavior_name = Style_DefaultHorse
		new_behavior_name_threat = Style_DefaultHorse_Threat
		new_behavior_name_no_threat = Style_DefaultHorse_Life
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = bv_stand
		dynamite_front_behavior = Bv_Horse_DynamiteFrontResponse
		dynamite_behind_behavior = Bv_Horse_DynamiteBehindResponse
		noise_detection_low_behavior = Bv_Horse_NoiseVolLowResponse
		noise_detection_mid_behavior = Bv_Horse_NoiseVolMidResponse
		noise_detection_high_behavior = Bv_Horse_NoiseVolHighResponse}
	RegisterAnimalStyleBehaviors {new_behavior_name = Style_DefaultElk
		new_behavior_name_threat = Style_DefaultElk_Threat
		new_behavior_name_no_threat = Style_DefaultElk_Life
		no_threat_behavior = Bv_RunLifeWithItems
		life_behavior = Bv_PedLife
		dynamite_front_behavior = Bv_Elk_DynamiteFrontResponse
		dynamite_behind_behavior = Bv_Elk_DynamiteBehindResponse
		noise_detection_low_behavior = Bv_Elk_NoiseVolLowResponse
		noise_detection_mid_behavior = Bv_Elk_NoiseVolMidResponse
		noise_detection_high_behavior = Bv_Elk_NoiseVolHighResponse
		detection_params = [{name = min_reaction_time val = 0.0}
			{name = max_reaction_time val = 0.0}
			{name = high_vol_dist val = 4000}
			{name = mid_vol_dist val = 5500}
			{name = low_vol_dist val = 6500}]}
endscript

script RegisterAnimalStyleBehaviors 
	registerstate {
		name = <new_behavior_name>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = areaset
						state = agent_setareas
						params = [{name = combat_areas ref = combat_areas}
							{name = search_areas ref = search_areas}
							{name = center ref = center}
							{name = center_dist ref = center_dist}]
					}
					{replacement = setlife
						state = agent_setlife
						params = [{name = behavior_life_id ref = behavior_life_id}
							{name = behavior_life_id val = <life_behavior>}
							{name = behavior_life_params ref = behavior_life_params}]
					}
					{replacement = child
						state = <new_behavior_name_no_threat>
					}
				]
			}
		]
	}
	registerstate {
		name = <new_behavior_name_no_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = alert state = Bv_Style_CommonAnimalDetection}
					{replacement = threat state = Bv_DetectAnimalThreats params = <detection_params>}
					{replacement = trample state = Bv_DetectTrampleDanger}
					{replacement = child state = <no_threat_behavior>}]
			}
			{events = [animalalert_dynamitedetection_front]
				responses = [{replacement = child state = <dynamite_front_behavior>}]
			}
			{events = [animalalert_dynamitedetection_behind]
				responses = [{replacement = child state = <dynamite_behind_behavior>}]
			}
			{events = [animalalert_noisedetection_low]
				responses = [{replacement = child state = <noise_detection_low_behavior>}]
			}
			{events = [animalalert_noisedetection_mid]
				responses = [{replacement = child state = <noise_detection_mid_behavior>}]
			}
			{events = [animalalert_noisedetection_high]
				responses = [{replacement = child state = <noise_detection_high_behavior>}]
			}
			{events = [Potential_Trample_Danger]
				responses = [{replacement = child state = Bv_AnimalProcessPotentialTrample}]
			}
			{events = [Full_Trample_Danger]
				responses = [{replacement = child state = Bv_AnimalProcessFullTrample}]
			}
			{events = [Wagon_Trample_Danger]
				responses = [{replacement = child state = Bv_AnimalProcessWagonTrample}]
			}
			{events = [got_interest_enemy , shot]
				responses = [{replacement = this state = <new_behavior_name_threat>}]
			}
			{events = [DetectionResponse_Finished]
				responses = [{replacement = child state = <no_threat_behavior>}]
			}
		]
	}
	shot_move_desc = {movement = run_fast
		stopping_distance = 0.75
		arrival_distance = 5
		stop_distance = 5}
	registerstate {
		name = <new_behavior_name_threat>
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child state = Bv_ThreatReactionMove}]
			}
			{events = [ThreatReactionMove_Finished]
				responses = [{replacement = this state = <new_behavior_name_no_threat>}]
			}
		]
	}
endscript
