PedMinBumpedSpeed = 0.5
PedMinBumpedBigSpeed = 1.5
PedMinBumpedKnockDownSpeed = 6.5
PedKnockedDownBroadcastDist = 20.0
bump_active = 1

script RegisterBehaviors_SkateReaction_Bumped 
	registerstate {
		name = Bv_HandleBumpedEvent
		transitions = [{events = [enter_behavior]
				responses = [{replacement = reaction
						state = agent_pushreactionstate
						params = [{name = state val = bump}]
					}
					{
						replacement = move_stop
						state = Bv_StopInstant
					}
					{replacement = board
						state = Bv_HideBoard
					}
					{replacement = sfx
						state = soundevent
						params = [{name = event ref = sfx_event}]
					}
					{replacement = vo
						state = playvoiceoverbyevent
						params = [{name = event_id ref = vo_event}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = reaction
						state = agent_popreactionstate
					}]
			}
		]
	}
	registerstate {
		name = Bv_ReactToBump
		task = {name = task_reacttobump
			params = {anim_tree = $Agent_AnimBranch_Reaction
				min_bumped_speed = $PedMinBumpedSpeed
				min_bumped_big_speed = $PedMinBumpedBigSpeed
				min_bumped_knockdown_speed = $PedMinBumpedKnockDownSpeed
				bumped_anims = $SkatePed_BumpedAnims}
		}
		transitions = [{
				events = [bumped_small]
				responses = [{replacement = child
						state = Bv_HandleBumpedEvent
						params = [{name = sfx_event val = Ped_Hit_By_Skater_Small_SFX}
							{name = vo_event val = avoid}]
					}]
			}
			{
				events = [bumped_big]
				responses = [{replacement = child
						state = Bv_HandleBumpedEvent
						params = [{name = sfx_event val = Ped_Hit_By_Skater_Big_SFX}
							{name = vo_event val = avoid}]
					}]
			}
			{
				events = [bumped_knockdown]
				responses = [{replacement = child
						state = Bv_HandleBumpedEvent
						params = [{name = sfx_event val = Ped_Hit_By_Skater_KnockDown_SFX}
							{name = vo_event val = KnockDown}]
					}
					{replacement = lookat
						state = Bv_LookAtDuringGetupHACK
					}
					{replacement = broadcast
						state = eventcache_broadcast
						params = [{name = event_id val = Nearby_Ped_Knocked_Down}
							{name = event_radius val = $PedKnockedDownBroadcastDist}]
					}]
			}
			{events = [bumped_small_finished
					bumped_big_finished
					bumped_knockdown_finished]
				responses = [{replacement = child
						state = Bv_ShowBoard
					}
					{replacement = this
						state = Bv_SkatePedReactions
					}]
			}
			{events = [ragdoll_knockdown]
				responses = [{replacement = child
						state = Bv_HideBoard
					}
					{replacement = this
						state = Bv_RagdollKnockdown
						params = $bv_all_params
					}]
			}
			{events = [bumped_reaction_cancelled]
				responses = [{replacement = this
						state = Bv_SkatePedReactions
					}]
			}]
	}
endscript

script Bv_HideBoard 
	Navigation_GetSteeringObjId
	obj_getid
	if NOT (<objid> = <steering_obj_id>)
		<steering_obj_id> :hide
	endif
endscript

script Bv_ShowBoard 
	Navigation_GetSteeringObjId
	obj_getid
	if NOT (<objid> = <steering_obj_id>)
		<steering_obj_id> :unhide
		interact_clearcurnode
	endif
endscript

script Bv_LookAtDuringGetupHACK 
	pedlife_gettype
	if (<ped_type> = ped_life)
		wait \{1.2
			seconds}
		Interest_SetLocation \{location = skater}
		ai_giveorder \{name = Bv_LookAt_Location}
	endif
endscript
