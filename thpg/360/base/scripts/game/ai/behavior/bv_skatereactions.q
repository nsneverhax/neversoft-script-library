
script RegisterBehaviors_SkateReaction 
	registerstate {
		name = Bv_SkatePedReactionBase
		transitions = [{events = [enter_behavior]
				responses = [{replacement = pause state = Bv_SkatePedReactionsInactive}
					{replacement = child state = Bv_SkatePedReactions}]
			}]
	}
	registerstate {
		name = Bv_SkatePedReactionsInactive
		transitions = [{events = [bumped ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_SkatePedReactionsActive
					}]
			}]
	}
	registerstate {
		name = Bv_SkatePedReactionsActive
		task = {name = Task_PauseAgent}
		transitions = [{events = [deactivate_reactions]
				responses = [{replacement = this
						state = Bv_SkatePedReactionsInactive
					}]
			}]
	}
	registerstate {
		name = Bv_SkatePedReactions
		transitions = [{events = [enter_behavior
					reaction_finished]
				recur = true
				responses = [{replacement = event
						state = Bv_AddEvent
						params = [{name = event_id val = deactivate_reactions}]
					}]
			}
			{events = [bumped]
				responses = [{replacement = this
						state = Bv_ReactToBump
						params = $bv_all_params
					}]
			}
			{events = [ragdoll_knockdown]
				responses = [{replacement = this
						state = Bv_RagdollKnockdown
						params = $bv_all_params
					}]
			}
			{events = [surprise]
				responses = [{replacement = this
						state = Bv_ReactToSurprise
						params = $bv_all_params
					}]
			}]
	}
	registerstate {
		name = Bv_ManageReactionState
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = agent_pushreactionstate
						params = [{name = state ref = state}]
					}]
			}
			{events = [exit_behavior]
				responses = [{replacement = child
						state = agent_popreactionstate
					}]
			}]
	}
endscript
