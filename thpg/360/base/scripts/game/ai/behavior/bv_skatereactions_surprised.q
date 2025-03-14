max_surprised_peds = 4
surprise_broadcast_radius = 5.0

script RegisterBehaviors_SkateReaction_Surprised 
	registerstate {
		name = Bv_ReactToSurprise
		task = {name = task_surprised
			params = {success_event = Surprise_Reaction_Start
				failed_event = Surprise_reaction_Cancelled}
		}
		transitions = [{events = [Surprise_Reaction_Start]
				responses = [
					{replacement = child
						state = Bv_ReactToSurprise_Start
						params = $bv_all_params
					}]
			}
			{events = [Surprise_reaction_Cancelled Surprise_Reaction_Finished]
				responses = [{replacement = this
						state = Bv_SkatePedReactions
					}]
			}]
	}
	registerstate {
		name = Bv_ReactToSurprise_StartTimer
		task = {name = Task_GenEvents_Timer
			params = {min_duration_secs = 0.1
				max_duration_secs = 0.3
				event_id = Surprised_Reaction_StartTimer_Finished}
		}
	}
	registerstate {
		name = Bv_ReactToSurprise_Start
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_ReactToSurprise_StartTimer
					}]
			}
			{events = [Surprised_Reaction_StartTimer_Finished]
				responses = [{replacement = child
						state = Bv_PlaySurpriseAnim
						params = $bv_all_params
					}]
			}]
	}
	registerstate {
		name = Bv_PlaySurpriseAnim
		task = {name = Task_PlayReactionAnim
			params = {anim_tree = $Agent_AnimBranch_Reaction
				my_timer_type = play
				event_id = Surprise_Reaction_Finished
			}
		}
	}
endscript
