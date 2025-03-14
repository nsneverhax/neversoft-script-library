
script RegisterBehaviors_SkateGoalPed 
	registerstate {
		name = Bv_GoalPed
		transitions = [{
				events = [enter_behavior] Bv_LifeNodeInteractions
				responses = [{
						replacement = detect
						state = Bv_GetAttentionDetect
					}
					{
						replacement = life_node_interactions
						state = Bv_LifeNodeInteractions
					}
					{
						replacement = state
						state = Bv_GoalPed_GoalPedLife
					}]
			}]
	}
	registerstate {
		name = Bv_GoalPed_GoalPedLife
		transitions = [{events = [enter_behavior] responses = [{replacement = child state = Bv_GoalPedLife}]}
			{events = [Start_Get_Attention]
				conditions = [{name = IsGoalPedGetAttentionEnabled}]
				responses = [{replacement = this state = Bv_GoalPed_TransitionToGetAttention}]}
			{events = [Start_Go_To_Next_Goal] responses = [{replacement = this state = Bv_GoalPed_TransitionToGoToNextGoal}]}
			{events = [goal_activated
					goal_unpause] responses = [{replacement = this state = Bv_GoalPed_TransitionToWatchPlayerInGoal}]}]
	}
	registerstate {
		name = Bv_GoalPed_GetAttention
		transitions = [{events = [enter_behavior] responses = [{replacement = child state = Bv_GetAttention}]}
			{events = [goal_activated
					goal_unpause] responses = [{replacement = this state = Bv_GoalPed_WatchPlayerInGoal}]}
			{events = [Get_Attention_Done] responses = [{replacement = this state = Bv_GoalPed_GoalPedLife}]}]
	}
	registerstate {
		name = Bv_GoalPed_WatchPlayerInGoal
		transitions = [{events = [enter_behavior] responses = [{replacement = child state = Bv_WatchPlayerInGoal}]}
			{events = [goal_quit_expired] responses = [{replacement = this state = Bv_GoalPed_GoalPedLife}]}
			{events = [Start_Go_To_Next_Goal] responses = [{replacement = this state = Bv_GoalPed_GoToNextGoal}]}]
	}
	registerstate {
		name = Bv_GoalPed_UseLifeNodesInGoal
		transitions = [{events = [enter_behavior] responses = [{replacement = event state = eventcache_add params = [{name = event_id val = Start_Using_Life_Nodes}]}]}
			{events = [goal_quit_expired] responses = [{replacement = this state = Bv_GoalPed_GoalPedLife}]}
			{events = [Start_Go_To_Next_Goal] responses = [{replacement = event state = eventcache_add params = [{name = event_id val = Stop_Using_Life_Nodes}]}
					{replacement = this state = Bv_GoalPed_TransitionToGoToNextGoal}]}]
	}
	registerstate {
		name = Bv_GoalPed_GoToNextGoal
		transitions = [{events = [enter_behavior] responses = [{replacement = child state = Bv_GoToNextGoal}]}
			{events = [Go_To_Next_Goal_Done] responses = [{replacement = this state = Bv_GoalPed_GoalPedLife}]}]
	}
	registerstate {
		name = Bv_GoalPed_TransitionToGetAttention
		transitions = [{conditions = [{name = interact_compareinteractstate params = {state = invalid}}]
				responses = [{replacement = this state = Bv_GoalPed_GetAttention}]}]
	}
	registerstate {
		name = Bv_GoalPed_TransitionToGoToNextGoal
		transitions = [{conditions = [{name = interact_compareinteractstate params = {state = invalid}}]
				responses = [{replacement = this state = Bv_GoalPed_GoToNextGoal}]}]
	}
	registerstate {
		name = Bv_GoalPed_TransitionToWatchPlayerInGoal
		transitions = [{conditions = [{name = interact_compareinteractstate params = {state = invalid}}]
				responses = [{replacement = this state = Bv_GoalPed_WatchPlayerInGoal}]}]
	}
	registerstate {
		name = Bv_GoalPedLife
		transitions = [{events = [enter_behavior]
				responses = [{
						replacement = event
						state = eventcache_add
						params = [{name = event_id val = Start_Using_Life_Nodes}]
					}]
			}
			{events = [exit_behavior]
				responses = [{
						replacement = event
						state = eventcache_add
						params = [{name = event_id val = Stop_Using_Life_Nodes}]
					}]
			}]
	}
	registerstate {
		name = Bv_LifeNodeInteractions
		transitions = [{events = [Start_Using_Life_Nodes]
				responses = [{
						replacement = child
						state = Bv_Agent_Life
					}]
			}
			{events = [Stop_Using_Life_Nodes]
				conditions = [{name = IsGoalPedGetAttentionEnabled}]
				responses = [{
						replacement = child
						state = null
					}]
			}]
	}
endscript

script GPed_SetInitGoal 
	settags cur_goal_id = <goal_id>
endscript

script GPed_GoalIntroSetup 
	if getsingletag cur_goal_id
		if GMan_GetTrackInfo goal = <cur_goal_id>
			if structurecontains structure = <track_info> intro_setup_script
				script_name = (<track_info>.intro_setup_script)
			endif
		endif
	endif
	if gotparam script_name
		if scriptexists <script_name>
			<script_name>
		else
			scriptassert "Goal intro setup script %a for goal %b doesn't exist." a = <script_name> b = <cur_goal_id>
		endif
	else
		GPed_FacePlayer
	endif
endscript

script GPed_FacePlayer block = true finished_event_id = Is_Facing_Player
	agent_setinterest interest_type_id = location object_id = player1 acquire_vis_loc = false
	ai_giveorder {replacement = force_align
		name = bv_setmovedesc
		params = {movement_desc = {force_align = true}
			movement_desc_stage = action}}
	ai_giveorder {replacement = aimat_location_player
		name = Bv_AimAt_Location
		params = {finished_event_id = <finished_event_id>}}
	ai_giveorder {replacement = lookat_location_player
		name = Bv_LookAt_Location}
	if (<block> = true)
		blockuntilevent type = <finished_event_id>
	endif
endscript

script IsInGoal 
	if gman_hasactivegoals
		return \{true}
	else
		return \{false}
	endif
endscript

script IsGoalPedGetAttentionEnabled 
	if agent_isinvehicletransition
		return \{false}
	endif
	if getsingletag \{disable_goal_ped_get_attention}
		return \{false}
	endif
	return \{true}
endscript

script IsGoalPedWatchPlayerInGoalEnabled 
	getsingletag \{cur_goal_id}
	if GMan_GetTrackInfo goal = <cur_goal_id> name = use_watch_player_in_goal_bhv
		if (<use_watch_player_in_goal_bhv> = true)
			return \{true}
		endif
	endif
	return \{false}
endscript
