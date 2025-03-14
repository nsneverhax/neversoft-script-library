
script RegisterBehaviors_SkateSpectatorPed 
	registerstate {
		name = Bv_SpectatorPed
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = state
						state = Bv_SpectatorPed_UseInteractionNodes
					}]
			}]
	}
	registerstate {
		name = Bv_SpectatorPed_UseInteractionNodes
		transitions = [{events = [enter_behavior]
				responses = [{replacement = impress_locals_detect
						state = Bv_ImpressLocalsDetect
					}
					{replacement = child
						state = Bv_Agent_Life
					}
					{replacement = use_prev_node
						state = SpectatorPed_UsePrevNode
					}]
			}
			{events = [Impressive_Score_Detected]
				conditions = [{name = IsSpectatorPedWatchPlayerEnabled
					}]
				responses = [{replacement = this
						state = Bv_SpectatorPed_TransitionToWatchPlayer
					}]
			}]
	}
	registerstate {
		name = Bv_SpectatorPed_TransitionToWatchPlayer
		transitions = [{conditions = [{name = interact_compareinteractstate
						params = {state = invalid}
					}]
				responses = [{replacement = this
						state = Bv_SpectatorPed_WatchPlayer
					}]
			}]
	}
	registerstate {
		name = Bv_SpectatorPed_WatchPlayer
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_WatchPlayer
					}]
			}
			{events = [Watch_Player_Done]
				responses = [{replacement = this
						state = Bv_SpectatorPed_UseInteractionNodes
					}]
			}]
	}
endscript

script IsSpectatorPedWatchPlayerEnabled 
	if agent_isinvehicletransition
		return \{false}
	endif
	if agent_hasvehicleofspecies \{species = skateboard}
		return \{false}
	endif
	if NOT gamemodeequals \{is_career}
		return \{false}
	endif
	if NOT agent_comparereactionstateparam \{param = notice_enabled
			val = true}
		return \{false}
	endif
	return \{true}
endscript

script SpectatorPed_UsePrevNode 
	interact_getprevnode
	if NOT (<prev_node> = invalid_node_name)
		interact_forceusenode name = <prev_node>
	endif
endscript
