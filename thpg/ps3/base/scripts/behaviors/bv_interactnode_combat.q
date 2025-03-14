
script RegisterBehaviors_InteractNode_Combat 
	RegisterBehaviors_InteractNode_Combat_Core
	RegisterBehaviors_InteractNode_Combat_UseCoverHide
	RegisterBehaviors_InteractNode_Combat_UseCoverAttack
	RegisterBehaviors_InteractNode_Combat_Standard
	RegisterBehaviors_InteractNode_Combat_Sheriff
endscript

script RegisterBehaviors_InteractNode_Combat_Core 
	registerstate {
		name = Bv_InteractNode_Combat_DodgeMoveTo
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = move
						state = Bv_CombatNode_MoveTo
						params = [{name = finished_event_id ref = finished_event_id}]
					}
					{replacement = dodge state = Bv_DodgeReactions}
				]
			}
			{
				conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished state = interact_clearcurnode}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Dodge
		task =
		{
			name = Task_Dodge
			params = {
				anim_stage = custom
				finished_event_id = CombatNode_Dodge_Finished}
		}
		transitions =
		[
			{
				events = [CombatNode_Dodge_Finished]
				responses =
				[
					{replacement = finished state = interact_clearcurnode}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Use_Move
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = stand
						state = bv_stand
					}
					{
						replacement = move
						state = Bv_InteractNode_SlideTo
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Use_DodgeMove
		task =
		{
			name = Task_DetectDodgeReaction
			params =
			{
				dodge_left_event_id = DodgeReactions_DodgeLeft
				dodge_right_event_id = DodgeReactions_DodgeRight
			}
		}
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = move state = Bv_InteractNode_Combat_Use_Move}]
			}
			{
				events = [DodgeReactions_DodgeLeft]
				responses =
				[
					{replacement = this
						state = Bv_InteractNode_Combat_Dodge
						params = [{name = direction val = left}]
					}
				]
			}
			{events = [DodgeReactions_DodgeRight]
				responses =
				[
					{replacement = this
						state = Bv_InteractNode_Combat_Dodge
						params = [{name = direction val = right}]
					}
				]
			}
			{
				conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses =
				[
					{replacement = finished state = interact_clearcurnode}
				]
			}
		]
	}
endscript

script RegisterBehaviors_InteractNode_Combat_UseCoverHide 
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						condition = {name = agent_comparevalidcover params = {state = true}}
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverHide_EnterCover
						weight = 1.0
					}
					{
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverHide_Attack
						weight = 0.0
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_Attack
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = attack
				params =
				{
					enter_cover_event_id = Attack_Enter_Cover
					finished_event_id = Attack_Finished
				}
			}
		}
		transitions =
		[
			{
				events = [Attack_Enter_Cover]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_EnterCover}]
			}
			{
				events = [Attack_Finished]
				responses = [{replacement = finished state = interact_clearcurnode}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_EnterFromSibling
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = enterlinkedcoverhide
				params = {finished_event_id = EnterLinkedCoverHide_Finished}
			}
		}
		transitions =
		[
			{
				events = [EnterLinkedCoverHide_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_Cover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_EnterCover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = entercoverhide
				params = {finished_event_id = EnterCoverHide_Finished}
			}
		}
		transitions =
		[
			{
				events = [EnterCoverHide_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_Cover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_Cover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = coverhide
				params =
				{
					exit_cover_event_id = CoverHide_Exit
					finished_event_id = CoverHide_Finished
				}
			}
		}
		transitions =
		[
			{
				events = [CoverHide_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_ChooseTransition}]
			}
			{
				events = [CoverHide_Exit]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_ExitCover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_ChooseTransition
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						condition = {name = Agent_ShouldPeekFromCover}
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverHide_Peek
						weight = 1.0
					}
					{
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverHide_ExitToSibling
						weight = 0.0
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_ExitToSibling
		task =
		{
			name = Task_UseInteractNodeSibling
			params = {type = enterlinkedcoverattack}
		}
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_Peek
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = peek
				params = {finished_event_id = Peek_Finished}
			}
		}
		transitions =
		[
			{
				events = [Peek_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_Cover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverHide_ExitCover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = exitcoverhide
				params = {finished_event_id = ExitCoverHide_Finished}
			}
		}
		transitions =
		[
			{
				events = [ExitCoverHide_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverHide_Attack}]
			}
		]
	}
endscript

script RegisterBehaviors_InteractNode_Combat_UseCoverAttack 
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack
		transitions =
		[
			{
				events = [enter_behavior]
				responses =
				[
					{
						condition = {name = agent_comparevalidcover params = {state = true}}
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverAttack_EnterCover
						weight = 1.0
					}
					{
						replacement = this
						state = Bv_InteractNode_Combat_UseCoverAttack_Attack
						weight = 0.0
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_Attack
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = attack
				params =
				{
					enter_cover_event_id = Attack_Enter_Cover
					finished_event_id = Attack_Finished
				}
			}
		}
		transitions =
		[
			{
				events = [Attack_Enter_Cover]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_EnterCover}]
			}
			{
				events = [Attack_Finished]
				responses = [{replacement = finished state = interact_clearcurnode}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_EnterFromSibling
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = enterlinkedcoverattack
				params = {finished_event_id = EnterLinkedCoverAttack_Finished}
			}
		}
		transitions =
		[
			{
				events = [EnterLinkedCoverAttack_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_Cover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_EnterCover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = entercoverattack
				params = {finished_event_id = EnterCoverAttack_Finished}
			}
		}
		transitions =
		[
			{
				events = [EnterCoverHide_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_Cover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_Cover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = coverattack
				params =
				{
					exit_cover_event_id = CoverAttack_Exit
					finished_event_id = CoverAttack_Finished
				}
			}
		}
		transitions =
		[
			{
				events = [CoverAttack_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_ExitToSibling}]
			}
			{
				events = [CoverAttack_Exit]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_ExitCover}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_ExitToSibling
		task =
		{
			name = Task_UseInteractNodeSibling
			params = {type = enterlinkedcoverhide}
		}
	}
	registerstate {
		name = Bv_InteractNode_Combat_UseCoverAttack_ExitCover
		task =
		{
			name = Task_RunInteractNodeBehavior
			params =
			{
				type = exitcoverattack
				params = {finished_event_id = ExitCoverAttack_Finished}
			}
		}
		transitions =
		[
			{
				events = [ExitCoverAttack_Finished]
				responses = [{replacement = this state = Bv_InteractNode_Combat_UseCoverAttack_Attack}]
			}
		]
	}
endscript

script RegisterBehaviors_InteractNode_Combat_Standard 
	registerstate {
		name = Bv_InteractNode_Combat_Standard_Move
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = move
						state = Bv_InteractNode_Combat_DodgeMoveTo
						params = [{name = finished_event_id ref = finished_event_id}]
					}
					{replacement = item state = Bv_SimpleAimCombat_AllItems}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Standard_Attack
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{replacement = move state = Bv_InteractNode_Combat_Use_DodgeMove}
					{replacement = attack state = Bv_SimpleAimCombat_AllItems}
				]
			}
			{
				conditions = [{name = agent_comparevalidcover params = {state = true}}]
				responses =
				[
					{
						replacement = event
						state = eventcache_add
						params = [{name = event_id ref = enter_cover_event_id}]
					}
				]
			}
			{
				conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses =
				[
					{
						replacement = event
						state = eventcache_add
						params = [{name = event_id ref = finished_event_id}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Standard_CoverHide
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = stop_timer
						state = Bv_CoverHideStopTimer
						params = [{name = finished_event_id ref = finished_event_id}]
					}
					{
						replacement = lock
						state = Bv_InteractNode_SlideTo
					}
					{
						replacement = anim
						state = Bv_PlayAnimSet
						params =
						[
							{name = anim_stage val = custom}
							{name = anim_set_id ref = anim_set_id}
							{name = sync_start_time val = false}
						]
					}
				]
			}
			{
				conditions =
				[
					{name = agent_comparevalidcover params = {state = false}}
					{name = interact_compareinteractstate params = {state = exiting}}
				]
				responses =
				[
					{
						replacement = event
						state = eventcache_add
						params = [{name = event_id ref = exit_cover_event_id}]
					}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Standard_CoverAttack
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = stop_timer
						state = Bv_CoverAttackStopTimer
						params = [{name = finished_event_id ref = finished_event_id}]
					}
					{
						replacement = lock
						state = Bv_InteractNode_SlideTo
					}
					{
						replacement = anim
						state = Bv_PlayAnimSet
						params =
						[
							{name = anim_stage val = custom}
							{name = anim_set_id ref = anim_set_id}
							{name = sync_start_time val = false}
						]
					}
					{
						replacement = attack
						state = Bv_SimpleAimCombat_AllItems
					}
				]
			}
			{
				conditions =
				[
					{name = agent_comparevalidcover params = {state = false}}
					{name = interact_compareinteractstate params = {state = exiting}}
				]
				responses =
				[
					{
						replacement = event
						state = eventcache_add
						params = [{name = event_id ref = exit_cover_event_id}]
					}
				]
			}
		]
	}
endscript

script RegisterBehaviors_InteractNode_Combat_Sheriff 
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Move
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = move
						state = Bv_InteractNode_Combat_DodgeMoveTo
						params = [{name = finished_event_id ref = finished_event_id}]
					}
					{replacement = equip state = Bv_EnableItemControlEquip}
					{replacement = look state = Bv_AimAt_Target}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Attack
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{replacement = move state = Bv_InteractNode_Combat_Use_Move}
					{replacement = combat state = Bv_InteractNode_Combat_Sheriff_Attack_Equip}
				]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Attack_Shoot
		task = {name = Task_LockAimAtPos}
		transitions =
		[
			{
				events = [enter_behavior]
				responses = [{replacement = use state = Bv_UseEquippedItem_Once}]
			}
			{
				events = [using_item]
				responses = [{replacement = this state = Bv_InteractNode_Combat_Sheriff_Attack_Equip}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Attack_Reload
		task = {name = Task_LockAimAtPos}
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses =
				[
					{
						replacement = clear_uses
						state = inventory_setactiveitemloadeduses
						params = [{name = uses val = 0}]
					}
					{replacement = reload state = Bv_ReloadItem_Once}
				]
			}
			{
				events = [ReloadEquippedItem_Once_Finished] ,
				responses = [{replacement = this state = Bv_InteractNode_Combat_Sheriff_Attack_Shoot}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Attack_Aim
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_AimAt_Target}]
			}
			{
				conditions = [{name = agent_hasclearaim result = true}]
				responses = [{replacement = this state = Bv_InteractNode_Combat_Sheriff_Attack_Reload}]
			}
			{
				conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished state = interact_clearcurnode}]
			}
		]
	}
	registerstate {
		name = Bv_InteractNode_Combat_Sheriff_Attack_Equip
		task = {name = Task_ItemControlEquip}
		transitions =
		[
			{
				events = [enter_behavior] ,
				responses = [{replacement = child state = Bv_AimAt_Target}]
			}
			{
				conditions = [{name = itemcontrol_comparerangedweaponactive params = {state = true}}]
				responses = [{replacement = this state = Bv_InteractNode_Combat_Sheriff_Attack_Aim}]
			}
			{
				conditions = [{name = interact_compareinteractstate params = {state = exiting}}]
				responses = [{replacement = finished state = interact_clearcurnode}]
			}
		]
	}
endscript
