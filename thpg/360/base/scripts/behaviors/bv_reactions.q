Hit_Duration = 0.3
Temp_Disabled_Duration = 0.1
Incapacitated_Min_Duration = 15
Incapacitated_Max_Duration = 25
Grab_Animation = PedE_Host_Idle_xx
Grab_Idle_Animation = PedE_Host_Idle_xx
Grab_Forward_Animation = PedE_Host_Wlk_xSlw_Fdx
Grab_Backward_Animation = PedE_Host_Wlk_xSlw_Bx
Grab_Left_Animation = PedE_Host_Wlk_xSlw_Lx
Grab_Right_Animation = PedE_Host_Wlk_xSlw_Rx
Grab_IdleToStruggle_Animation = PedE_Host_Idle_xx
Grab_Struggle_Animation = PedE_Host_Idle_xx
Grab_StruggleToIdle_Animation = PedE_Host_Idle_xx
Grab_Release_Animation = PedMGen_Idle_xx
Grab_Escape_Animation = PedMGen_Idle_xx
bv_all_params = [
	{
		name = no_name
		ref = all_params
	}
]

script RegisterBehaviors_Reaction 
	registerstate {
		name = Bv_PedReactionBase
		transitions = [{events = [enter_behavior]
				responses = [{replacement = pause state = Bv_PedReactionsInactive}
					{replacement = child state = Bv_PedReactions}]
			}
			{events = [burn_damage]
				responses = [{replacement = this state = Bv_FleeOnFireReaction params = $bv_all_params}]
			}
			{events = [burn_no_anim]
				responses = [{replacement = this state = Bv_FleeOnFireNoAnimReaction params = $bv_all_params}]
			}
			{events = [burn_init_anim]
				responses = [{replacement = this state = Bv_FleeOnFireInitAnimReaction params = $bv_all_params}]
			}
			{events = [burn_mounted]
				responses = [{replacement = this state = Bv_FleeOnFireMountedReaction params = $bv_all_params}]
			}
			{events = [burn_mounted_horse]
				responses = [{replacement = this state = Bv_FleeOnFireInitAnimReaction params = $bv_all_params}]
			}
		]
	}
	registerstate {
		name = Bv_PedReactionsInactive
		task = {name = Task_ExitReactions}
		transitions = [{events = [hit_damage
					hit_melee
					mounted_hit_damage
					temp_disable_damage
					incapacitate_damage
					disable_hit_damage
					grapple
					death_damage
					gib_death
					mounted_death_damage
					custom_death
					rag_doll_death
					burn_no_motion
					mounted_death_damage_delayed
					horse_death_damage_slide
				]
				responses = [{replacement = this
						state = Bv_PedReactionsActive
						params = [{name = no_name ref = allow_navigation}
							{name = no_name ref = allow_dodge}
							{name = no_name ref = allow_inventory}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_PedReactionsActive
		task = {name = Task_PauseAgent}
		transitions = [{events = [deactivate_reactions]
				responses = [{replacement = this
						state = Bv_PedReactionsInactive
					}
				]
			}
			{events = [incapacitate_damage temp_disable_damage disable_hit_damage]
				responses = [{replacement = el_pauso
						state = Bv_PauseAgent
					}]
			}
		]
	}
	registerstate {
		name = Bv_PedReactions
		transitions = [{events = [enter_behavior reaction_finished]
				recur = true
				responses = [{replacement = event state = Bv_AddEvent params = [{name = event_id val = deactivate_reactions}]}
					{replacement = sh state = Bv_ShotHandler}]
			}
			{events = [temp_disable_damage]
				responses = [{replacement = this state = Bv_TempDisabled params = $bv_all_params}]
			}
			{events = [incapacitate_damage]
				responses = [{replacement = this state = Bv_Incapacitated params = $bv_all_params}]
			}
			{events = [death_damage custom_death]
				responses = [{replacement = this state = Bv_TransitionToDeadOnGround params = $bv_all_params}]
			}
			{events = [mounted_death_damage]
				responses = [{replacement = this state = Bv_TransitionToDeadOnHorse params = $bv_all_params}]
			}
			{events = [mounted_death_damage_delayed]
				responses = [{replacement = this state = Bv_TransitionToFallingOffRide params = $bv_all_params}]
			}
			{events = [horse_death_damage_slide]
				responses = [{replacement = this state = Bv_TransitionToWipeOutDeath params = $bv_all_params}]
			}
			{events = [gib_death]
				responses = [{replacement = this state = Bv_Gib params = $bv_all_params}]
			}
			{events = [grapple]
				responses = [{replacement = this state = Bv_GrappledReaction}]
			}
			{events = [rag_doll_death]
				responses = [{replacement = this state = Bv_RagDoll params = $bv_all_params}]
			}
			{events = [burn_no_motion]
				responses = [{replacement = this state = Bv_NoMotionOnFire params = $bv_all_params}]
			}
		]
	}
	registerstate {
		name = Bv_Damage
		task = {name = Task_Damage}
		transitions = [{events = [drop_item]
				responses = [{replacement = drop
						state = Bv_DropItem
						params = [{name = attacker ref = attacker}
							{name = hit_dir ref = hit_dir}
							{name = no_name ref = direct_hit}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_TransitionToDeadOnGround
		transitions = [{events = [enter_behavior]
				responses = [{replacement = deactivate
						state = Bv_Deactivate
						params = [{name = attacker ref = attacker}
							{name = weapon ref = weapon}
						]
					}
					{replacement = child
						state = Bv_PlayReactionAnim
						params = [{name = my_anim ref = anim}
							{name = my_speed ref = anim_speed}
							{name = anim_tree ref = anim_tree}
							{name = orient_type ref = orient_type}
							{name = flipped_state ref = flipped_state}
							{name = event_point val = 0}
							{name = event_id val = custom_death_finished}
							{name = blend_period ref = blend_period}
						]
					}
					{replacement = shot_handler
						state = Bv_ShotHandler
					}
				]
			}
			{events = [custom_death_finished]
				responses = [{replacement = dead
						state = Bv_DeadOnGround
						params = [{name = hit_bone ref = hit_bone}
							{name = attacker ref = attacker}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_TransitionToDeadOnGround_NoAnimation
		transitions = [{events = [enter_behavior]
				responses = [{replacement = deactivate
						state = Bv_Deactivate
						params = [{name = attacker ref = attacker}
							{name = weapon ref = weapon}
						]
					}
					{replacement = shot_handler
						state = Bv_ShotHandler
					}
					{replacement = dead
						state = Bv_DeadOnGround
						params = [{name = hit_bone ref = hit_bone}
							{name = attacker ref = attacker}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_TransitionToFallingOffRide
		transitions = [{events = [enter_behavior]
				responses = [{replacement = veh_steer
						state = Bv_TransferSteeringToVehicle
						params = [{name = speed ref = speed}]
					}
					{replacement = anm
						state = Bv_PlayReactionAnim
						params = [{name = my_anim ref = anim}
							{name = my_speed ref = anim_speed}
							{name = anim_tree ref = anim_tree}
							{name = orient_type ref = orient_type}
							{name = flipped_state ref = flipped_state}
							{name = event_point val = 0}
							{name = event_id val = die_mf}
						]
					}
					{replacement = shot_handler
						state = Bv_ShotHandler
					}
					{replacement = dead
						state = targetable_settargettype
						params = [{name = no_name val = object}]
					}
				]
			}
			{events = [detach_from_ride]
				responses = [{replacement = slide_baby
						state = Bv_RagDollSlideOnly
						params = [
							{name = hit_bone ref = hit_bone}
							{name = weapon ref = weapon}
							{name = attacker ref = attacker}
							{name = no_name val = slide_only}
							{name = slide_vector ref = slide_vector}
							{name = no_name val = use_vehicle_vector}
							{name = weapon_damage ref = weapon_damage}
							{name = weapon_type ref = weapon_type}
							{name = hit_pos ref = hit_pos}
							{name = source_pos ref = source_pos}
							{name = hit_dir ref = hit_dir}
							{name = no_name ref = direct_hit}
						]
					}
					{replacement = deactivate
						state = Bv_Deactivate
						params = [{name = attacker ref = attacker}
							{name = weapon ref = weapon}
						]
					}
				]
			}
			{events = [die_mf]
				responses = [{replacement = dead
						state = Bv_TransitionToDeadOnGround_NoAnimation
						params = [{name = hit_bone ref = hit_bone}
							{name = attacker ref = attacker}
							{name = weapon ref = weapon}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_TransitionToWipeOutDeath
		transitions = [{events = [enter_behavior]
				responses = [{replacement = dead
						state = Bv_TransitionToDeadOnGround
						params = $bv_all_params
					}
					{replacement = slide_baby
						state = Bv_RagDollSlideOnly
						params = [
							{name = hit_bone ref = hit_bone}
							{name = weapon ref = weapon}
							{name = attacker ref = attacker}
							{name = no_name val = slide_only}
							{name = slide_vector ref = slide_vector}
							{name = no_name val = use_obj_vector}
							{name = weapon_damage ref = weapon_damage}
							{name = weapon_type ref = weapon_type}
							{name = hit_pos ref = hit_pos}
							{name = source_pos ref = source_pos}
							{name = hit_dir ref = hit_dir}
							{name = no_name ref = direct_hit}
						]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_Gib
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_TransitionToDeadOnGround_NoAnimation
						params = [{name = hit_bone ref = hit_bone}
							{name = attacker ref = attacker}
							{name = weapon ref = weapon}
						]
					}
					{replacement = anim
						state = Bv_PlayReactionAnim
						params = [{name = my_anim val = `default`}
							{name = anim_tree ref = anim_tree}
							{name = orient_type ref = orient_type}
						]
					}
					{replacement = msg
						state = bv_message
						params = [{name = my_anim val = `default`}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_PlayReactionAnim
		task = {name = Task_PlayReactionAnim
			params = {anim_tree = $Agent_AnimBranch_Reaction
				my_timer_type = play
			}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = hostage state = Bv_ReleaseHostage}]
			}
		]
	}
	registerstate {
		name = Bv_MeleeReaction
		task = {name = Task_MeleeReaction
			params = {anim_tree = $Agent_AnimBranch_MeleeRec
			}
		}
		transitions = [{events = [reaction_finished]
				responses = [{replacement = this
						state = Bv_PedReactions
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_CycleReactionAnim
		task = {name = Task_PlayReactionAnim
			params = {anim_tree = $Agent_AnimBranch_Reaction
				my_timer_type = cycle
			}
		}
	}
	registerstate {
		name = Bv_ShotHandler
		transitions = [{events = [shot]
				recur = true
				responses = [{replacement = child
						state = Bv_Damage
						params = [{name = no_name ref = all_params}]
					}
				]
			}
			{events = [hit_melee]
				recur = true
				responses = [{replacement = anim
						state = Bv_MeleeReaction params = $bv_all_params
					}
				]
			}
			{events = [hit_damage , mounted_hit_damage , disable_hit_damage]
				recur = true
				responses = [{replacement = anim
						state = Bv_PlayReactionAnim
						params = [{name = my_anim ref = anim}
							{name = my_speed ref = anim_speed}
							{name = anim_tree ref = anim_tree}
							{name = orient_type ref = orient_type}
							{name = flipped_state ref = flipped_state}
							{name = event_id ref = event_id}
							{name = event_id val = reaction_finished}
							{name = blend_period ref = blend_period}
						]
					}
					{replacement = timer
						state = Bv_Timer
						params = [
							{name = min_duration_secs ref = disable_secs}
							{name = max_duration_secs ref = disable_secs}
							{name = min_duration_secs val = Hit_Duration}
							{name = max_duration_secs val = Hit_Duration}
							{name = event_id val = hit_timer_expired}
						]
					}
					{replacement = disable_events
						state = Bv_DisableHitEvents
					}
				]
			}
			{events = [diff_hit_damage]
				recur = true
				responses = [{replacement = anim
						state = PlayDiffHitAnim
						params = [{name = no_name ref = all_params}]
					}
					{replacement = timer
						state = Bv_Timer
						params = [{name = min_duration_secs val = Hit_Duration}
							{name = max_duration_secs val = Hit_Duration}
							{name = event_id val = hit_timer_expired}
						]
					}
					{replacement = disable_events
						state = Bv_DisableHitEvents
					}
				]
			}
			{events = [hit_timer_expired]
				responses = [{replacement = disable_events
						state = bv_blank
					}
				]
			}
			{events = [horse_dead]
				responses = [{replacement = release_me
						state = Bv_ForcedReleaseVehicle_ReleaseOnly
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_ShotHandler_NoAnimation
		transitions = [{events = [shot]
				recur = true
				responses = [{replacement = child state = Bv_Damage params = $bv_all_params}]
			}
			{events = [horse_dead]
				responses = [{replacement = release_me
						state = Bv_ForcedReleaseVehicle_ReleaseOnly
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_DisableHitEvents
		task = {name = Task_DisableHitEvents}
	}
	registerstate {
		name = Bv_Deactivate
		task = {name = Task_Deactivate}
	}
	registerstate {
		name = Bv_ExitDamageState
		task = {name = task_runscript
			params = {script_name = AIInfo_SetDamageState
				script_params = {none}
			}
		}
	}
endscript

script PlayDiffHitAnim 
	anim_command {target = HitReaction
		command = hitreactiondifference_initiatehitreaction
		params = {anim_name = <anim>}
	}
endscript

script Bv_DeadOnGround 
	AIInfo_SetDamageState attacker = <attacker> dead
	anim_updatepose
	anim_enable off
	agent_setvoicestreamminlogicpriority {priority = (StreamLogicPriority_VoiceDeath)}
	if gotparam event_id
		eventcache_add event_id = <event_id>
	endif
	pedlife_removecount
	getsingletag dont_change_priority
	if NOT gotparam dont_change_priority
		obj_getpriority
		if (<objpriority> = coim_priority_permanent)
			obj_setpriority coim_priority_permanentcleanup
		endif
	endif
	obj_getid
	eventcache_add event_id = dead_on_ground event_data = {subject = <objid> attacker = <attacker>}
	obj_spawnscriptlater Ai_EnableDeadMode
endscript

script Bv_EnableScalping 
	if german
		return
	endif
	if gotparam \{scalp_disable}
		return
	endif
	has_scalpingblade
	if (<scalpingblade_owned> = 0)
		return
	endif
	proximity_init \{innerradius = 0.9
		outerradius = 1.2
		enterproximityscript = RequestScalpInteractionFocus
		exitproximityscript = relinquish_interaction_focus}
	settags {
		scalp_offset = <scalp_offset>
		scalp_angles = <scalp_angles>
	}
endscript

script Bv_DropItem 
	Agent_DropItem <...>
endscript
