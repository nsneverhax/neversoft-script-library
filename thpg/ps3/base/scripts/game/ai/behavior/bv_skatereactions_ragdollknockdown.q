
script RegisterBehaviors_SkateRagdollKnockdown 
	registerstate {
		name = Bv_PlayBranchAnim
		task = {name = Task_PlayReactionAnim
			params = {anim_tree = $Agent_AnimBranch_Reaction
				my_timer_type = play
			}
		}
	}
	registerstate {
		name = Bv_RagdollKnockdown
		task = {name = task_bodycheck
			params = {finished_event_id = ragdoll_finished}
		}
		transitions = [{events = [enter_behavior]
				responses = [{replacement = reaction_state
						state = agent_pushreactionstate
						params = [{name = state val = bump}]
					}
					{replacement = interact
						state = interact_clearcurnode
					}
					{replacement = vo
						state = playvoiceoverbyevent
						params = [{name = event_id val = KnockDown}]
					}
					{replacement = skateboard
						state = Bv_UnequipSkateboardInstant
					}
				]
			}
			{events = [ragdoll_finished]
				responses = [{replacement = this
						state = Bv_RagdollKnockdown_StandUp
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = reaction_state
						state = agent_popreactionstate
					}]
			}]
	}
	registerstate {
		name = Bv_RagdollKnockdown_StandUp
		transitions = [{events = [enter_behavior]
				responses = [{replacement = reaction_state
						state = agent_pushreactionstate
						params = [{name = state val = bump}]
					}
					{replacement = child
						state = RagdollKnockdown_StandUp
					}]
			}
			{events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_RagdollKnockdown
						params = $bv_all_params
					}]
			}
			{events = [Ragdoll_Knockdown_Done]
				responses = [{replacement = this
						state = Bv_SkatePedReactions
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = board
						state = Bv_ShowBoard
					}
					{replacement = reaction_state
						state = agent_popreactionstate
					}]
			}]
	}
endscript

script ped_Ragoll_Bail_Get_Orientation 
	ragdoll_getorientation
	if (<face_up> > 0.4)
		orientation = back
	else
		if (<face_up> < -0.4)
			orientation = forward
		else
			if (<on_side> > 0.0)
				orientation = left
			else
				orientation = right
			endif
		endif
	endif
	return orientation = <orientation>
endscript
Agent_Bail_Getup_Anims = {
	forward = {
		default_anim = PedM_Sprawled_F_GetUp_F
	}
	back = {
		default_anim = PedM_Sprawled_B_GetUp_F
	}
	left = {
		default_anim = PedM_Fetal_L_GetUp_F
	}
	right = {
		default_anim = PedM_Fetal_R_GetUp_F
	}
}

script RagdollKnockdown_StandUp 
	printf "****** RAGDOLLKNOCKDOWN_STANDUP"
	ped_Ragoll_Bail_Get_Orientation
	anim_struct = ($Bail_Writhe_Anims.<orientation>)
	anim = (<anim_struct>.default_anim)
	ai_giveorder {name = Bv_PlayBranchAnim params = {my_anim = <anim>
			blend_period = 0.3
			event_id = ped_bail_writhe_finished}}
	blockuntilevent type = ped_bail_writhe_finished
	obj_getid
	locator_teleport node = <objid>
	if NOT pedlife_iscriticalped
		if NOT locator_iscontained traveler = terrain_ped_trivial
			RagDoll_fade_and_destroy
			return
		endif
	endif
	ragdoll_orientobject
	ped_Ragoll_Bail_Get_Orientation
	anim_struct = ($Agent_Bail_Getup_Anims.<orientation>)
	anim = (<anim_struct>.default_anim)
	ai_giveorder {name = Bv_PlayBranchAnim params = {my_anim = <anim>
			blend_period = 0.1
			event_id = ped_bail_getup_finished}}
	ragdoll_blendtoinactive blendduration = 0.3
	blockuntilevent type = ped_bail_getup_finished
	ragdoll_setstate state = empty
	eventcache_add event_id = Ragdoll_Knockdown_Done
endscript

script RagDoll_fade_and_destroy 
	printf \{"RAGDOLL FADE AND DESTROY"}
	ped_fade_and_destroy
endscript

script bodycheck_agentdeath 
	wait \{$body_check_death_delay
		seconds}
	Agent_InstantDeath
endscript

script agent_ragdoll_hit_bone 
	switch <bone>
		case bone_pelvis
		soundevent event = Bail_Nutter_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_stomach_upper
		case bone_stomach_lower
		soundevent event = Bail_Torso_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_head
		case bone_neck
		soundevent event = Bail_Head_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_bicep_l
		case bone_forearm_l
		case bone_palm_l
		soundevent event = Bail_Left_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_bicep_r
		case bone_forearm_r
		case bone_palm_r
		soundevent event = Bail_Right_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_thigh_l
		case bone_knee_l
		case bone_ankle_l
		soundevent event = Bail_Left_Leg_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		case bone_thigh_r
		case bone_knee_r
		case bone_ankle_r
		soundevent event = Bail_Right_Leg_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
		default
		soundevent event = Bail_Right_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
		endif
	endswitch
endscript
