
script RegisterBehaviors_SkateAmbientPed 
	registerstate {
		name = Bv_AmbientPed
		transitions = [{
				events = [enter_behavior]
				responses = [{replacement = handle_emotions
						state = Bv_HandleEmotions
					}
					{
						replacement = push_detect
						state = Bv_GenEvents_Push
					}
					{
						replacement = state
						state = Bv_AmbientPed_UseInteractionNodes
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_UseInteractionNodes
		transitions = [{events = [enter_behavior]
				responses = [{replacement = impress_locals_detect
						state = Bv_ImpressLocalsDetect
					}
					{replacement = notice_detect
						state = Bv_NoticeDetect
					}
					{replacement = vo_idle
						state = IdleVO
					}
					{
						replacement = child
						state = eventcache_add
						params = [{name = event_id val = get_emotion}]
					}]
			}
			{
				events = [is_calm]
				responses = [{replacement = child
						state = Bv_Agent_Life
					}]
			}
			{events = [Skater_Push]
				recur = true
				responses = [{replacement = push
						state = Bv_SkaterPed_Push
					}]
			}
			{events = [Impressive_Score_Detected]
				conditions = [{name = IsAmbientPedWatchPlayerEnabled}]
				responses = [{replacement = this
						state = Bv_AmbientPed_TransitionToWatchPlayer}]
			}
			{events = [Player_Noticed]
				conditions = [{name = IsAmbientPedNoticeEnabled}]
				responses = [{replacement = this
						state = Bv_AmbientPed_TransitionToNotice}]
			}
			{events = [is_annoyed_angry
					is_chase_angry]
				conditions = [{name = IsAmbientPedAnnoyedEnabled}]
				responses = [{replacement = this
						state = Bv_AmbientPed_TransitionToAngryAnnoyed}]
			}
			{$AmbientPed_ReactToTrample_Transition_1
			}
			{$AmbientPed_ReactToTrample_Transition_2
			}
			{$AmbientPed_ReactToTrample_Transition_3
			}]
	}
	registerstate {
		name = Bv_AmbientPed_WatchPlayer
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_WatchPlayer
					}]
			}
			{events = [Watch_Player_Done]
				responses = [{replacement = this
						state = Bv_AmbientPed_UseInteractionNodes
					}]
			}
			{$AmbientPed_ReactToTrample_Transition_1
			}
			{$AmbientPed_ReactToTrample_Transition_2
			}
			{$AmbientPed_ReactToTrample_Transition_3
			}]
	}
	registerstate {
		name = Bv_AmbientPed_Notice
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_Notice
					}]
			}
			{events = [is_annoyed_angry
					is_chase_angry]
				conditions = [{name = IsAmbientPedAnnoyedEnabled
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_AngryAnnoyed
					}]
			}
			{events = [Notice_Reaction_Done]
				responses = [{replacement = this
						state = Bv_AmbientPed_UseInteractionNodes
					}]
			}
			{$AmbientPed_ReactToTrample_Transition_1
			}
			{$AmbientPed_ReactToTrample_Transition_2
			}
			{$AmbientPed_ReactToTrample_Transition_3
			}]
	}
	registerstate {
		name = Bv_AmbientPed_AngryAnnoyed
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = AmbientPed_AngryAnnoyed
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_FleeFromPedKnockdown
		transitions = [{events = [enter_behavior]
				responses = [{replacement = child
						state = Bv_FleeFromPedKnockdown
					}]
			}
			{events = [is_annoyed_angry
					is_chase_angry]
				conditions = [{name = IsAmbientPedAnnoyedEnabled
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_AngryAnnoyed
					}]
			}
			{events = [Flee_From_Ped_Knockdown_Done]
				responses = [{replacement = this
						state = Bv_AmbientPed_UseInteractionNodes
					}]
			}
			{$AmbientPed_ReactToTrample_Transition_1
			}
			{$AmbientPed_ReactToTrample_Transition_2
			}
			{$AmbientPed_ReactToTrample_Transition_3
			}]
	}
	registerstate {
		name = Bv_AmbientPed_DodgeTrample
		transitions = [{events = [enter_behavior]
				responses = [{replacement = stop_anims
						state = agent_stopcustomanims
					}
					{replacement = dodge
						state = Bv_DodgeByReactionState_Dodge
						params = [{name = dodge_direction ref = dodge_direction}]
					}]
			}
			{events = [escape_danger_finished
					EscapeTrample_Dodge_Finished
					bumped]
				responses = [{replacement = this
						state = Bv_AmbientPed_AngryAnnoyed
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_RunFromTrample
		transitions = [{events = [enter_behavior]
				responses = [{replacement = stop_anims
						state = agent_stopcustomanims
					}
					{replacement = dodge
						state = Bv_EscapeFullTrample_Move
					}]
			}
			{events = [escape_danger_finished
					EscapeTrample_Dodge_Finished
					bumped]
				responses = [{replacement = this
						state = Bv_AmbientPed_AngryAnnoyed
					}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_TransitionToWatchPlayer
		transitions = [{conditions = [{name = interact_compareinteractstate
						params = {state = invalid}
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_WatchPlayer}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_TransitionToNotice
		transitions = [{conditions = [{name = interact_compareinteractstate
						params = {state = invalid}
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_Notice}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_TransitionToAngryAnnoyed
		transitions = [{conditions = [{name = interact_compareinteractstate
						params = {state = invalid}
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_AngryAnnoyed}]
			}]
	}
	registerstate {
		name = Bv_AmbientPed_TransitionToFleeFromPedKnockdown
		transitions = [{conditions = [{name = interact_compareinteractstate
						params = {state = invalid}
					}]
				responses = [{replacement = this
						state = Bv_AmbientPed_FleeFromPedKnockdown}]
			}]
	}
endscript

script AmbientPed_AngryAnnoyed 
	if Agent_IsAngry
		Agent_GetAngerTarget
		enemy = <anger_target>
	else
		enemy = player1
	endif
	agent_setinterest interest_type_id = enemy object_id = <enemy> acquire_vis_loc = false
endscript

script IsAmbientPedAnnoyedEnabled 
	if agent_isinvehicletransition
		eventcache_add \{event_id = force_calm_down}
		return \{false}
	endif
	if agent_hasvehicleofspecies \{species = skateboard}
		eventcache_add \{event_id = force_calm_down}
		return \{false}
	endif
	if NOT gamemodeequals \{is_career}
		eventcache_add \{event_id = force_calm_down}
		return \{false}
	endif
	return \{true}
endscript

script IsAmbientPedNoticeEnabled 
	if agent_isinvehicletransition
		return \{false}
	endif
	if agent_hasvehicleofspecies \{species = skateboard}
		return \{false}
	endif
	if ($NumAngryChaseBehaviorPeds > 0)
		return \{false}
	endif
	return \{true}
endscript

script IsAmbientPedWatchPlayerEnabled 
	if agent_isinvehicletransition
		return \{false}
	endif
	if agent_hasvehicleofspecies \{species = skateboard}
		return \{false}
	endif
	if NOT gamemodeequals \{is_career}
		return \{false}
	endif
	return \{true}
endscript

script DoesNotHaveSkateboard 
	if agent_hasvehicleofspecies \{species = skateboard}
		return \{false}
	endif
	return \{true}
endscript

script IsNotOnSkateboard 
	if agent_isinvehicletransition
		return \{false}
	endif
	if agent_hasvehicleofspecies \{species = skateboard}
		return \{false}
	endif
	return \{true}
endscript
IdleVoIsPlaying = false

script IdleVO 
	onexitrun IdleVOExit
	settags PlayingIdleVO = false
	getrandomvalue name = delay a = 20.0 b = 30.0
	wait <delay> seconds
	begin
	if ($IdleVoIsPlaying = false)
		if ($NumNoticeBehaviorPeds < $MaxNoticeBehaviorPeds)
			settags PlayingIdleVO = true
			change IdleVoIsPlaying = true
			playvoiceoverbyevent event_id = idle finished_event_id = Idle_Vo_Finished failed_event_id = Idle_Vo_Failed
			blockuntilevent anytypes = [Idle_Vo_Finished Idle_Vo_Failed]
			settags PlayingIdleVO = false
			change IdleVoIsPlaying = false
		endif
	endif
	getrandomvalue name = delay a = 30.0 b = 45.0
	wait <delay> seconds
	repeat
endscript

script IdleVOExit 
	getsingletag \{PlayingIdleVO}
	if (<PlayingIdleVO> = true)
		agent_stopvo
		settags \{PlayingIdleVO = false}
		change \{IdleVoIsPlaying = false}
	endif
endscript
AmbientPed_ReactToTrample_Transition_1 = {
	events = [
		Potential_Trample_Danger
		Full_Trample_Danger
	]
	conditions = [
		{
			name = agent_comparereactionstateparam
			params = {
				param = dodge_enabled
				val = true
			}
		}
	]
	recur = true
	responses = [
		{
			replacement = DodgeByReactionState
			state = Bv_DodgeByReactionState
			params = [
				{
					name = no_name
					ref = all_params
				}
			]
		}
	]
}
AmbientPed_ReactToTrample_Transition_2 = {
	events = [
		Dodge_Trample
	]
	responses = [
		{
			replacement = this
			state = Bv_AmbientPed_DodgeTrample
			params = [
				{
					name = dodge_direction
					ref = dodge_direction
				}
			]
		}
	]
}
AmbientPed_ReactToTrample_Transition_3 = {
	events = [
		Run_From_Trample
	]
	responses = [
		{
			replacement = this
			state = Bv_AmbientPed_RunFromTrample
		}
	]
}
